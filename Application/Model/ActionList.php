<?php

namespace rs\banner\Application\Model;

/**
 * Class StartController
 *
 * @package rs\banner\Application\Model
 * @see \OxidEsales\EshopCommunity\Application\Model\ActionList
 *
 */
class ActionList extends ActionList_parent
{

    /**
     * load active shop banner list
     */
    public function loadBanners()
    {
        parent::loadBanners();
        $oBaseObject = $this->getBaseObject();
        $oViewName = $oBaseObject->getViewName();
        $sQ = "select * from {$oViewName} where oxtype=3 and " . $oBaseObject->getSqlActiveSnippet()
            . " and oxshopid='" . $this->getConfig()->getShopId() . "' " . $this->_getUserGroupFilter()
            . " order by rsrow, rscol";
        $this->selectString($sQ);
    }
}