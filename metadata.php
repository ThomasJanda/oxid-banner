<?php
$sMetadataVersion = '2.0';

$aModule = array(
    'id'               => 'rs_banner',
    'title'            => '*RS Banner',
    'description'      => 'Promotion Banner, replace Promotion Slider',
    'thumbnail'        => '',
    'version'          => '0.0.1',
    'author'           => '',
    'url'              => '',
    'email'            => '',
    'extend'           => array(
        \OxidEsales\Eshop\Application\Controller\Admin\ActionsMain::class => rs\banner\Application\Controller\Admin\ActionsMain::class,
        \OxidEsales\Eshop\Application\Controller\StartController::class => rs\banner\Application\Controller\StartController::class,
        \OxidEsales\Eshop\Application\Controller\ContentController::class => rs\banner\Application\Controller\ContentController::class,
        \OxidEsales\Eshop\Application\Controller\ArticleListController::class => rs\banner\Application\Controller\ArticleListController::class,
        \OxidEsales\Eshop\Application\Model\ActionList::class => rs\banner\Application\Model\ActionList::class,
        \OxidEsales\Eshop\Application\Model\ContentList::class => rs\banner\Application\Model\ContentList::class,
    ),
    'controllers' => array(
    ),
    'templates' => array(
        'rs/banner/views/tpl/widget/promoslider__dd_widget_promoslider.tpl' => 'rs/banner/views/tpl/widget/promoslider__dd_widget_promoslider.tpl'
    ),
    'blocks' => array(
        array(
            'template' => 'widget/promoslider.tpl',
            'block'=>'dd_widget_promoslider',
            'file'=>'/views/blocks/widget/promoslider__dd_widget_promoslider.tpl'
        ),
        array(
            'template' => 'actions_main.tpl',
            'block'=>'admin_actions_main_product',
            'file'=>'/views/admin/blocks/actions_main__admin_actions_main_product.tpl'
        ),
        
        array(
            'template' => 'layout/page.tpl',
            'block'=>'rs_banner',
            'file'=>'/views/blocks/layout/page__rs_banner.tpl'
        ),
        array(
            'template' => 'page/info/content.tpl',
            'block'=>'rs_banner',
            'file'=>'/views/blocks/page/info/content__rs_banner.tpl'
        ),
        array(
            'template' => 'page/list/list.tpl',
            'block'=>'rs_banner',
            'file'=>'/views/blocks/page/list/list__rs_banner.tpl'
        ),
    ),
    'settings'    => array(

        array(
            'group' => 'rs-banner_nivo_slider',
            'name'  => 'rs-banner_nivo_slider_effect',
            'type' => 'select',   
            'value' => 'random', 
            'position' => 0,
            'constraints' => 'random|sliceDown|sliceDownLeft|sliceUp|sliceUpLeft|sliceUpDown|sliceUpDownLeft|fold|fade|slideInRight|slideInLeft|boxRandom|boxRain|boxRainReverse|boxRainGrow|boxRainGrowReverse',
        ),
        array(
            'group' => 'rs-banner_nivo_slider',
            'name'  => 'rs-banner_nivo_slider_animSpeed',
            'type'  => 'str',
            'value' => '500',
        ),
        array(
            'group' => 'rs-banner_nivo_slider',
            'name'  => 'rs-banner_nivo_slider_pauseTime',
            'type'  => 'str',
            'value' => '3000',
        ),
        array(
            'group' => 'rs-banner_nivo_slider',
            'name'  => 'rs-banner_nivo_slider_directionNav',
            'type'  => 'bool',
            'value' => true,
        ),
        array(
            'group' => 'rs-banner_nivo_slider',
            'name'  => 'rs-banner_nivo_slider_controlNav',
            'type'  => 'bool',
            'value' => false,
        ),
        array(
            'group' => 'rs-banner_nivo_slider',
            'name'  => 'rs-banner_nivo_slider_captionClass',
            'type'  => 'str',
            'value' => '',
        ),
    ),
);