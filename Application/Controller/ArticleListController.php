<?php

namespace rs\banner\Application\Controller;

class ArticleListController extends ArticleListController_parent {

    public function getBanners()
    {
        $aList=[];
        $categoryId = \OxidEsales\Eshop\Core\Registry::getConfig()->getRequestParameter('cnid');
        
        if($categoryId!="")
        {
            $oBannerList = oxNew(\OxidEsales\Eshop\Application\Model\ActionList::class);
            $oBannerList->rs_banner_loadBanners($categoryId);

            foreach($oBannerList as $oBanner)
            {
                $aList[$oBanner->oxactions__rsrow->value][$oBanner->oxactions__rscol->value][]=$oBanner;
            }
        }

        return $aList;
    }
    
}
