<?php

namespace rs\banner\Application\Controller;

/**
 * Class StartController
 *
 * @package rs\banner\Application\Controller
 * @see \OxidEsales\Eshop\Application\Controller\StartController
 *
 */
class StartController extends StartController_parent
{

    /**
     * @return array
     * @throws \OxidEsales\Eshop\Core\Exception\DatabaseConnectionException
     * @throws \OxidEsales\Eshop\Core\Exception\DatabaseErrorException
     */
    public function getBanners()
    {
        $aBanners = parent::getBanners();

        $aList=[];
        foreach($aBanners as $oBanner)
        {
            $aList[$oBanner->oxactions__rsrow->value][$oBanner->oxactions__rscol->value][]=$oBanner;
        }

        return $aList;
    }
}