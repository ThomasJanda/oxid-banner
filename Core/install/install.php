<?php

namespace rs\banner\Core\install;

class install
{

    public function dbInstall()
    {
        $sqlStatments = [
            "ALTER TABLE `oxactions` ADD `rscol` INT(11) NOT NULL DEFAULT '1'",
            "ALTER TABLE `oxactions` ADD `rsrow` INT(11) NOT NULL DEFAULT '1'",
            "ALTER TABLE `oxactions` ADD `f_oxcategories` CHAR(32) CHARACTER SET latin1 COLLATE latin1_general_ci NULL DEFAULT NULL, ADD INDEX `f_oxcategories` (`f_oxcategories`)",
            "ALTER TABLE `oxactions` ADD `f_oxcontents` CHAR(32) CHARACTER SET latin1 COLLATE latin1_general_ci NULL DEFAULT NULL, ADD INDEX `f_oxcontents` (`f_oxcontents`)",
            "ALTER TABLE `oxactions` ADD `rsnot_startpage` TINYINT(1) NOT NULL DEFAULT '0'",
            "ALTER TABLE `oxactions` ADD `rsshow_alternative_title` TINYINT(1) NOT NULL DEFAULT '0'",
            "ALTER TABLE `oxactions` ADD `rsshow_alternative_title_1` TINYINT(1) NOT NULL DEFAULT '0'",
            "ALTER TABLE `oxactions` ADD `rsshow_alternative_title_2` TINYINT(1) NOT NULL DEFAULT '0'",
            "ALTER TABLE `oxactions` ADD `rsshow_alternative_title_3` TINYINT(1) NOT NULL DEFAULT '0'",
            "ALTER TABLE `oxactions` ADD `rsalternative_title` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''",
            "ALTER TABLE `oxactions` ADD `rsalternative_title_1` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''",
            "ALTER TABLE `oxactions` ADD `rsalternative_title_2` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''",
            "ALTER TABLE `oxactions` ADD `rsalternative_title_3` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''",
            "ALTER TABLE `oxactions` ADD `rsshow_alternative_short` TINYINT(1) NOT NULL DEFAULT '0'",
            "ALTER TABLE `oxactions` ADD `rsshow_alternative_short_1` TINYINT(1) NOT NULL DEFAULT '0'",
            "ALTER TABLE `oxactions` ADD `rsshow_alternative_short_2` TINYINT(1) NOT NULL DEFAULT '0'",
            "ALTER TABLE `oxactions` ADD `rsshow_alternative_short_3` TINYINT(1) NOT NULL DEFAULT '0'",
            "ALTER TABLE `oxactions` ADD `rsalternative_short` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''",
            "ALTER TABLE `oxactions` ADD `rsalternative_short_1` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''",
            "ALTER TABLE `oxactions` ADD `rsalternative_short_2` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''",
            "ALTER TABLE `oxactions` ADD `rsalternative_short_3` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''"
        ];
        $this->dbExecute($sqlStatments);
    }
    public function dbUninstall()
    {
        $sqlStatments = [
            "ALTER TABLE `oxactions` drop column `rscol`",
            "ALTER TABLE `oxactions` drop column `rsrow`",
            "ALTER TABLE `oxactions` drop column `f_oxcategories`",
            "ALTER TABLE `oxactions` drop column `f_oxcontents`",
            "ALTER TABLE `oxactions` drop column `rsnot_startpage`",
            "ALTER TABLE `oxactions` drop column `rsshow_alternative_title`",
            "ALTER TABLE `oxactions` drop column `rsshow_alternative_title_1`",
            "ALTER TABLE `oxactions` drop column `rsshow_alternative_title_2`",
            "ALTER TABLE `oxactions` drop column `rsshow_alternative_title_3`",
            "ALTER TABLE `oxactions` drop column `rsalternative_title`",
            "ALTER TABLE `oxactions` drop column `rsalternative_title_1`",
            "ALTER TABLE `oxactions` drop column `rsalternative_title_2`",
            "ALTER TABLE `oxactions` drop column `rsalternative_title_3`",
            "ALTER TABLE `oxactions` drop column `rsshow_alternative_short`",
            "ALTER TABLE `oxactions` drop column `rsshow_alternative_short_1`",
            "ALTER TABLE `oxactions` drop column `rsshow_alternative_short_2`",
            "ALTER TABLE `oxactions` drop column `rsshow_alternative_short_3`",
            "ALTER TABLE `oxactions` drop column `rsalternative_short`",
            "ALTER TABLE `oxactions` drop column `rsalternative_short_1`",
            "ALTER TABLE `oxactions` drop column `rsalternative_short_2`",
            "ALTER TABLE `oxactions` drop column `rsalternative_short_3`"
        ];
        $this->dbExecute($sqlStatments);
    }
    private function dbExecute($sqlStatments)
    {
        $oDb = \OxidEsales\Eshop\Core\DatabaseProvider::getDb(\OxidEsales\Eshop\Core\DatabaseProvider::FETCH_MODE_ASSOC);
        foreach ($sqlStatments as $sqlStatment) {
            try {
                $oDb->execute($sqlStatment);
            } catch (\Throwable $e) {
                //die($e->getMessage());
            }
        }
    }


    public function dbRefreshViews()
    {
        /** @var \OxidEsales\Eshop\Core\DbMetaDataHandler $oDbMetaDataHandler */
        $oDbMetaDataHandler = oxNew(\OxidEsales\Eshop\Core\DbMetaDataHandler::class);
        $oDbMetaDataHandler->updateViews();
    }


    public function clearCache($option)
    {
        $config = \OxidEsales\Eshop\Core\Registry::getConfig();
        $sTmpDir = realpath($config->getShopConfVar('sCompileDir'));

        $aFiles = [];

        switch ($option) {
            case 'smarty':
                $aFiles = glob($sTmpDir . '/smarty/*.php');
                break;
            case 'staticcache':
                $aFiles = glob($sTmpDir . '/ocb_cache/*.json');
                break;
            case 'language':
                \OxidEsales\Eshop\Core\Registry::getUtils()->resetLanguageCache();
                break;
            case 'database':
                $aFiles = glob($sTmpDir . '/*allfields*.txt');
                $aFiles = array_merge($aFiles, glob($sTmpDir . '/*allviews*.txt'));
                $aFiles = array_merge($aFiles, glob($sTmpDir . '/*tbdsc*.txt'));
                break;
            case 'seo':
                $aFiles = glob($sTmpDir . '/*seo.txt');
                break;
            case 'picture':
                $aFiles = glob($config->getPictureDir(false) . 'generated/*');
                break;
            case 'none':
            default:
                return;
        }

        if (count($aFiles) > 0) {
            foreach ($aFiles as $file) {
                if (is_file($file)) {
                    @unlink($file);
                } else {
                    $this->clearDir($file);
                }
            }
        }
    }
    private function clearDir($dir)
    {
        if (is_dir($dir)) {
            $files = array_diff(scandir($dir), ['.', '..']);
            foreach ($files as $file) {
                if (is_dir("$dir/$file")) {
                    $this->clearDir("$dir/$file");
                } else {
                    unlink("$dir/$file");
                }
            }

            return rmdir($dir);
        }

        return false;
    }


    /*
    public static function clearTmp($clearFolderPath = '')
    {
        $folderPath = self::_getFolderToClear($clearFolderPath);
        $directoryHandler = opendir($folderPath);

        if (!empty($directoryHandler)) {
            while (false !== ($fileName = readdir($directoryHandler))) {
                $filePath = $folderPath . DIRECTORY_SEPARATOR . $fileName;
                self::_clear($fileName, $filePath);
            }

            closedir($directoryHandler);
        }

        return true;
    }
    
    protected static function _getFolderToClear($clearFolderPath = '')
    {
        $templateFolderPath = (string) \OxidEsales\Eshop\Core\Registry::getConfig()->getConfigParam('sCompileDir');

        if (!empty($clearFolderPath) and (strpos($clearFolderPath, $templateFolderPath) !== false)) {
            $folderPath = $clearFolderPath;
        } else {
            $folderPath = $templateFolderPath;
        }

        return $folderPath;
    }
    protected static function _clear($fileName, $filePath)
    {
        if (!in_array($fileName, ['.', '..', '.gitkeep', '.htaccess'])) {
            if (is_file($filePath)) {
                @unlink($filePath);
            } else {
                self::clearTmp($filePath);
            }
        }
    }
    */
}
