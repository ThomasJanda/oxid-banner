<?php

namespace rs\banner\Application\Model;


class ContentList extends ContentList_parent
{

    public function rs_banner_getListAll()
    {
        $oDb = \OxidEsales\Eshop\Core\DatabaseProvider::getDb(\OxidEsales\Eshop\Core\DatabaseProvider::FETCH_MODE_ASSOC);

        $sViewName = $this->getBaseObject()->getViewName();
        $sSql = "SELECT * FROM {$sViewName} WHERE `oxactive` = '1' AND `oxshopid` = " . $oDb->quote($this->_sShopID) . " ORDER BY `oxloadid`";
        $aData = $oDb->getAll($sSql);
        $this->assignArray($aData);
    }
}
