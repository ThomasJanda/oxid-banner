# Oxid banner

## Description

Instead of display the banner with a slider, you can change it into a banner wall.

If you create a new banner you can add them to a row/column.
The system try to display the banner at that position. It try
to fill from the top down, from the left to the right. The 
row/column will use for sorting. 

If the system detect more then one banner on the same place, the system display 
a slider (nivo-slider) to display the information there at the same place.

You can select a categorie or/and a content page where the system should display the banner. 
If no categorie/content page selected, the banner will display on the start page.

New features:

    - alternative title
    - alternative description
    - additional css class for banner caption
    - change default nivo slider settings

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


        File: /var/www/html/oxid6_1_dev/source/Application/views/wave/tpl/page/info/content.tpl

            <h1 class="page-header">[{$template_title}]</h1>

            [{block name="rs_banner"}][{/block}]

            <article class="cmsContent">
                [{$oView->getParsedContent()}]
            </article>


        File: /var/www/html/oxid6_1_dev/source/Application/views/wave/tpl/page/list/list.tpl

                        <a class="rss" id="rssActiveCategory" aria-label="RSS Current Category" href="[{$rsslinks.activeCategory.link}]" title="[{$rsslinks.activeCategory.title}]" target="_blank">
                            <i class="fas fa-rss"></i>
                        </a>
                    [{/if}]
                </h1>
            </div>

            [{block name="rs_banner"}][{/block}]

            [{assign var="oPageNavigation" value=$oView->getPageNavigation()}]
            [{if $actCategory && $actCategory->getShortDescription() && $oPageNavigation->actPage == 1}]
                <p id="catDescLocator" class="categoryDescription">
                    <em>[{$actCategory->oxcategories__oxdesc->rawValue}]</em>
                </p>
            [{/if}]

5. Execute in Database

        ALTER TABLE `oxactions` ADD `rscol` INT(11) NOT NULL DEFAULT '0',
        ADD `rsrow` INT(11) NOT NULL DEFAULT '0';

        ALTER TABLE `oxactions` ADD `f_oxcategories` CHAR(32) 
        CHARACTER SET latin1 COLLATE latin1_general_ci NULL DEFAULT NULL, 
        ADD INDEX `f_oxcategories` (`f_oxcategories`); 

        ALTER TABLE `oxactions` ADD `f_oxcontents` CHAR(32) 
        CHARACTER SET latin1 COLLATE latin1_general_ci NULL DEFAULT NULL, 
        ADD INDEX `f_oxcontents` (`f_oxcontents`); 

        ALTER TABLE `oxactions` ADD `rsnot_startpage` TINYINT(1) NOT NULL DEFAULT '0'; 

        ALTER TABLE `oxactions` ADD `rsshow_alternative_title` TINYINT(1) NOT NULL DEFAULT '0'; 
        ALTER TABLE `oxactions` ADD `rsshow_alternative_title_1` TINYINT(1) NOT NULL DEFAULT '0'; 
        ALTER TABLE `oxactions` ADD `rsshow_alternative_title_2` TINYINT(1) NOT NULL DEFAULT '0'; 
        ALTER TABLE `oxactions` ADD `rsshow_alternative_title_3` TINYINT(1) NOT NULL DEFAULT '0'; 

        ALTER TABLE `oxactions` ADD `oxactions__rsalternative_title` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''; 
        ALTER TABLE `oxactions` ADD `oxactions__rsalternative_title_1` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''; 
        ALTER TABLE `oxactions` ADD `oxactions__rsalternative_title_2` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''; 
        ALTER TABLE `oxactions` ADD `oxactions__rsalternative_title_3` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''; 

        ALTER TABLE `oxactions` ADD `rsshow_alternative_short` TINYINT(1) NOT NULL DEFAULT '0'; 
        ALTER TABLE `oxactions` ADD `rsshow_alternative_short_1` TINYINT(1) NOT NULL DEFAULT '0'; 
        ALTER TABLE `oxactions` ADD `rsshow_alternative_short_2` TINYINT(1) NOT NULL DEFAULT '0'; 
        ALTER TABLE `oxactions` ADD `rsshow_alternative_short_3` TINYINT(1) NOT NULL DEFAULT '0'; 

        ALTER TABLE `oxactions` ADD `oxactions__rsalternative_short` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''; 
        ALTER TABLE `oxactions` ADD `oxactions__rsalternative_short_1` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''; 
        ALTER TABLE `oxactions` ADD `oxactions__rsalternative_short_2` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''; 
        ALTER TABLE `oxactions` ADD `oxactions__rsalternative_short_3` VARCHAR(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''; 
    
6. Update views. Clear DB-, Template-, Language-Cache files.
 
7. Enable module in the oxid admin area, Extensions => Modules