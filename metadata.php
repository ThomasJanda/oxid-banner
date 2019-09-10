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
        \OxidEsales\Eshop\Application\Controller\StartController::class => rs\banner\Application\Controller\StartController::class,
        \OxidEsales\Eshop\Application\Model\ActionList::class => rs\banner\Application\Model\ActionList::class,
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

    ),
    'settings'    => array(
    ),
);