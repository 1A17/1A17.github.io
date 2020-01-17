<?php

/*
 * @CODOLICENSE
 */
$smarty = \CODOF\Smarty\Single::get_instance();

$db = \DB::getPDO();

$permission = new \CODOF\Permission\Permission();

if (isset($_POST['site_title']) && CODOF\Access\CSRF::valid($_POST['CSRF_token'])) {
    $file = $_FILES['forum_logo'];
    $file_name = $file['name'];
    $file_type = $file ['type'];
    $file_size = $file ['size'];
    $file_path = $file ['tmp_name'];
    if (!move_uploaded_file($file_path, '../sites/default/assets/img/attachments/' . $file_name)) {
    } else {
        \CODOF\Util::set_opt('forum_logo', $file_name);
    }

    $cfgs = array();

    if (!isset($_POST['reg_req_admin'])) {
        $_POST['reg_req_admin'] = 'off';
    }
    foreach ($_POST as $key => $value) {

        if ($key == 'reg_req_admin') {
            $value = "on" == $value ? "yes" : "no";
        }

        if ($key == 'forum_privacy') {
            $permissionName = 'view forum';
            if($value == "everyone") {
                $permission->updateGeneralPermission(ROLE_GUEST, $permissionName, 1);
                $permission->updateGeneralPermission(ROLE_UNVERIFIED, $permissionName, 1);
            } else if ($value == "users") {
                $permission->updateGeneralPermission(ROLE_GUEST, $permissionName, 0);
                $permission->updateGeneralPermission(ROLE_UNVERIFIED, $permissionName, 1);
            } else {
                $permission->updateGeneralPermission(ROLE_GUEST, $permissionName, 0);
                $permission->updateGeneralPermission(ROLE_UNVERIFIED, $permissionName, 0);
            }
        }

        if ($key == "image") {
            $value = $file_name;
        }
        $query = "UPDATE " . PREFIX . "codo_config SET option_value=:value WHERE option_name=:key";
        $ps = $db->prepare($query);
        $ps->execute(array(':key' => $key, ':value' => htmlentities($value, ENT_QUOTES, 'UTF-8')));
        //echo $query."<br>\n";    
    }
}

CODOF\Util::get_config($db, true);

$guest_can_view_forum = $permission->hasGeneralPermission(ROLE_GUEST, 'view forum');
$unverified_user_can_view_forum = $permission->hasGeneralPermission(ROLE_UNVERIFIED, 'view forum');

if($guest_can_view_forum && $unverified_user_can_view_forum) {
    $can_view_forum = "everyone";
} else if ($unverified_user_can_view_forum) {
    $can_view_forum = "users";
} else {
    $can_view_forum = "verified_users";
}

$smarty->assign('can_view_forum', $can_view_forum);
$content = $smarty->fetch('config.tpl');
