<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:template match="monuments-list">
        <html>
            <head>
                <link rel="stylesheet" href="style/style.css"></link>
            </head>
            <body>
                <header>
                    <h1><xsl:value-of select="continent"/></h1>
                </header>
                <nav class="main_menu">
                    <ul class="main_menu_options">
                         <a class="main_option" href="africa.xml"><li>Àfrica</li></a>
                         <a class="main_option" href="america.xml"><li>Amèrica</li></a>
                         <a class="main_option" href="asia.xml"><li>Àsia</li></a>
                         <a class="main_option" href="europa.xml"><li>Europa</li></a>
                         <a class="main_option" href="oceania.xml"><li>Oceania</li></a>
                    </ul>
                 </nav>
                 <nav class="sub_menu">
                    <ul class="sub_menu_options">
                        <xsl:for-each select="countries/country">
                            <a class="sub_option" href="#{name}">
                                <li><xsl:value-of select="name"/></li>
                            </a>
                        </xsl:for-each>
                    </ul>
                 </nav>
                <main>
                    <xsl:apply-templates select="countries/country"/>     
                </main>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="country">
        <div class="country" id="{name}">
            <h2><xsl:value-of select="name"/></h2>
            <a class="flechita" href="">⬆</a>
            <section class="country_monuments">
                <xsl:apply-templates select="monuments/monument"/> 
            </section>
        </div>
    </xsl:template>

    <xsl:template match="monument">
        <a class="item" target="_blanck" href="https://ca.wikipedia.org/wiki/{url}">
            <img src="images/{image}.png"></img>
            <h3><xsl:value-of select="name"/></h3>
            <h4><xsl:value-of select="place"/></h4>
        </a>
    </xsl:template>
</xsl:stylesheet>