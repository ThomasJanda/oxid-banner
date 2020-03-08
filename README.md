# Oxid banner

## Description

Instead of display the banner with a slider, you can change it into a banner wall.

If you create a new banner you can add them to a row/column.
The system try to display the banner at that position. It try
to fill from the top down, from the left to the right. The 
row/column will use for sorting. 

If the system detect more then one banner on the same place, the system display 
a slider (nivo-slider) to display the information there at the same place.

You can select a categorie where the system should display the banner. If no categorie
selected, the banner will display on the start page.

*Used third party modules:*

    https://github.com/Codeinwp/Nivo-Slider-jQuery
    https://docs.themeisle.com/article/487-nivo-slider-settings

![](shop1.png)

Module was created for Oxid 6.x, "Wave" Theme.

![](settings.png)

## Install

1. Copy files into following directory

        source/modules/rs/banner
        
2. Add to composer.json at shop root
  
        "autoload": {
            "psr-4": {
                "rs\\banner\\": "./source/modules/rs/banner"
            }
        },

3. Refresh autoloader files with composer in the oxid root directory.

        composer dump-autoload

4. Template changes

        File: /source/Application/views/wave/tpl/layout/page.tpl add new block "rs_banner"

            <div class="[{if $blFullwidth}]container-fluid[{else}]container[{/if}]">
                <div class="row">
                [{block name="rs_banner"}]
                [{if $oView->getClassName()=='start' && $oView->getBanners() && !empty($oView->getBanners())}]
                    [{include file="widget/promoslider.tpl"}]
                [{/if}]
                [{/block}]
            </div>

5. Execute in Database

        ALTER TABLE `oxactions` ADD `rscol` INT(11) NOT NULL DEFAULT '0',
        ADD `rsrow` INT(11) NOT NULL DEFAULT '0';

        ALTER TABLE `oxactions` ADD `f_oxcategories` CHAR(32) 
        CHARACTER SET latin1 COLLATE latin1_general_ci NULL DEFAULT NULL, 
        ADD INDEX `f_oxcategories` (`f_oxcategories`); 
    
6. Update views
7. Enable module in the oxid admin area, Extensions => Modules