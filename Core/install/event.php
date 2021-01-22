<?php

namespace rs\banner\Core\install;

class event extends \OxidEsales\Eshop\Core\Module\Module
{

    /**
     * Module activation script.
     */
    public static function onActivate()
    {
        $o = new \rs\banner\Core\install\install();
        $o->dbInstall();
        $o->dbRefreshViews();
        $o->clearCache("database");
        $o->clearCache("smarty");
    }

    /**
     * Module deactivation script.
     */
    public static function onDeactivate()
    {
        $o = new \rs\banner\Core\install\install();
        $o->dbUninstall();
        $o->dbRefreshViews();
        $o->clearCache("database");
        $o->clearCache("smarty");
    }
}