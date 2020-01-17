<?php
$smarty = \CODOF\Smarty\Single::get_instance();
if (isset($_POST['language']) && CODOF\Access\CSRF::valid($_POST['CSRF_token'])) {

    $language = $_POST['language'];

    if (!empty($language)) {
        $parent_directory = "../sites/default/locale/";
        unlink($parent_directory."$language/$language.php");
        rmdir($parent_directory."$language");

        //Reset default language to english
        if($language == LOCALE) {
            \CODOF\Util::set_opt('default_language', 'en_US');
        }
    }
}
header("Location: index.php?page=system/language_settings");
exit(0);