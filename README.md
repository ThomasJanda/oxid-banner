# Oxid banner

## Description

Instead of display the banner with a slider, you can change it into a banner wall.

If you create a new banner you can add them to a row/column.
The system try to display the banner at that position. It try
to fill from the top down, from the left to the right. The 
row/column will use for sorting. 

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

4. Execute in Database

        ALTER TABLE `oxactions` ADD `rscol` INT(11) NOT NULL DEFAULT '0',
        ADD `rsrow` INT(11) NOT NULL DEFAULT '0';
    
5. Update views
6. Enable module in the oxid admin area, Extensions => Modules