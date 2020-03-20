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
        $this->rs_banner_loadBanners("");
    }
    
    public function rs_banner_loadBanners($f_oxcategories="", $f_oxcontents="")
    {
        $oBaseObject = $this->getBaseObject();
        $oViewName = $oBaseObject->getViewName();
        $sQ = "select * from {$oViewName} where oxtype=3 and " . $oBaseObject->getSqlActiveSnippet()
            . " and oxshopid='" . $this->getConfig()->getShopId() . "' " . $this->_getUserGroupFilter();
        if($f_oxcategories!="")
            $sQ.= " and f_oxcategories='".$f_oxcategories."' ";
        elseif($f_oxcontents!="")
            $sQ.= " and f_oxcontents='".$f_oxcontents."' ";
        else
            $sQ.=" and rsnot_startpage=0 ";
        $sQ.= " order by rsrow, rscol, oxsort";

        $this->selectString($sQ);
    }
}