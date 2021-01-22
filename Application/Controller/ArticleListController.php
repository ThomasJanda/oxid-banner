<?php

namespace rs\banner\Application\Controller;

class ArticleListController extends ArticleListController_parent
{

    public function getBanners()
    {
        $aList = [];
        /** @var \OxidEsales\Eshop\Core\Request $request */
        $request = oxNew(\OxidEsales\Eshop\Core\Request::class);
        $categoryId = $request->getRequestParameter('cnid');

        if ($categoryId != "") {
            /** @var \OxidEsales\Eshop\Application\Model\ActionList $oBannerList */
            $oBannerList = oxNew(\OxidEsales\Eshop\Application\Model\ActionList::class);
            $oBannerList->rs_banner_loadBanners($categoryId);

            foreach ($oBannerList as $oBanner) {
                $aList[$oBanner->oxactions__rsrow->value][$oBanner->oxactions__rscol->value][] = $oBanner;
            }
        }

        return $aList;
    }
}
