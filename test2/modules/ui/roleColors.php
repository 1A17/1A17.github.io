<?php


use CODOF\Util;

class RoleColors
{

    public $smarty;

    public function __construct($smarty)
    {
        $this->smarty = $smarty;
        $this->smarty->assign('msg', "");

    }

    public function getAllRoles()
    {
        $roles = DB::table(PREFIX . "codo_roles")->get();
        return $roles;
    }

    public function updateCss($roleId, $css)
    {
        DB::table(PREFIX . "codo_roles")
            ->where('rid', $roleId)
            ->update(['color' => $css]);
        $this->smarty->assign('msg', "CSS saved successfully!");
        $this->writeToLess();
    }

    public function getEditPage($roleId)
    {
        $role = DB::table(PREFIX . "codo_roles")->where("rid", $roleId)->first();
        $role['defaultColor'] = ".role_" . $role['rname'] . "{
        color: inherit;\n}";
        $this->smarty->assign('role', $role);
        $this->smarty->assign('defaultCss', $role);
        return $this->smarty->fetch('ui/role_colors_edit.tpl');
    }

    public function getDefaultPage()
    {
        $this->smarty->assign('roles', $this->getAllRoles());
        return $this->smarty->fetch('ui/role_colors.tpl');
    }


    /**
     * This less file is included to apply styles. Whatever css is updated via admin is written here.
     */
    private function writeToLess()
    {
        $roles = $this->getAllRoles();
        $contents = "";

        foreach ($roles as $role) {
            if ($role['color'] != null)
                $contents .= ".role_styled{$role['color']}\n\n";
        }

        Util::set_opt("role_styles", $contents);
    }

}


$roleColors = new RoleColors(\CODOF\Smarty\Single::get_instance());

if (isset($_GET['action'])) {

    if ($_GET['action'] == 'editRoleColor') {
        $roleId = (int)$_GET['id'];
        $content = $roleColors->getEditPage($roleId);
    } else if ($_GET['action'] == 'save') {

        if (CODOF\Access\CSRF::valid($_POST['CSRF_token'])) {
            $roleId = (int)$_POST['roleId'];
            $css = $_POST['role_css'];
            $roleColors->updateCss($roleId, $css);
            $content = $roleColors->getEditPage($roleId);
        } else {
            $content = $roleColors->getDefaultPage();
        }
    } else {
        $content = $roleColors->getDefaultPage();
    }

} else {
    $content = $roleColors->getDefaultPage();
}
