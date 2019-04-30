<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="utf-8" />
                <link rel="stylesheet" type="text/css" href="style.css" />
                <title>List of favorite movies</title>
            </head>
            <body>
                    <div class="film">
                        <xsl:for-each select="/movieList/movie">
                            <xsl:sort select="name" order="ascending"></xsl:sort>
                                <div class="film_onlist">
                                    <xsl:attribute name="style">
                                        <xsl:choose>
                                            <xsl:when test="@type='comedy'">
                                                background-color: #D4A46D
                                            </xsl:when>
                                            <xsl:when test="@type='thriller'">
                                                background-color: #DFCC74
                                            </xsl:when>
                                            <xsl:when test="@type='document'">
                                                background-color: #C3E991
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <filmtitle><xsl:value-of select="name" /></filmtitle>
                                    <br />
                                    <br />
                                    <genre>Genre: <xsl:value-of select="@type" /></genre>
                                    <div class="poster">
                                        <img style="width: 100%">
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="poster" />
                                            </xsl:attribute>
                                        </img>
                                    </div>
                                    <p>
                                    Director: <xsl:value-of select="director" />
                                    </p>
                                    <actors>
                                    Main actor: <xsl:value-of select="actor[@type='foreground']" />
                                    <br />
                                    Supporting role: <xsl:value-of select="actor[@type='supporting']" />
                                    </actors>
                                </div>
                                <xsl:if test="position()=last()">
                                    <p>(More movies to follow soon)</p>
                                </xsl:if>
                        </xsl:for-each>
                    </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>