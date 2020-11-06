<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="rng" xmlns:rng="http://relaxng.org/ns/structure/1.0"
    xmlns:uuid="java.util.UUID" exclude-result-prefixes="rng uuid">

    <xsl:output method="text" encoding="UTF-8" xml:space="default"/>

    <xsl:template match="/">
        <xsl:result-document href="CSV/terminologyList-withUUIDs.csv" method="text">
            <xsl:text>label,category,UUID,URI&#10;</xsl:text>
            <xsl:for-each select="//rng:value">
                <xsl:variable name="random" select="uuid:randomUUID()"/>
                <xsl:choose>
                    <xsl:when test=". = 'NK'"/>
                    <xsl:when test=". = 'other'"/>
                    <xsl:when test=". = 'yes'"/>
                    <xsl:when test=". = 'no'"/>
                    <!-- CSV -->
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test=". = 'tannedSkin'">
                                <xsl:text>leather</xsl:text>
                            </xsl:when>
                            <xsl:when test=". = 'left'">
                                <xsl:text>upper</xsl:text>
                            </xsl:when>
                            <xsl:when test=". = 'right'">
                                <xsl:text>lower</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>                                
                                <xsl:value-of select="if (contains(.,',')) then translate(.,',','-') else ."/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:text>,</xsl:text>
                        <xsl:choose>
                            <xsl:when test="ancestor::rng:define">
                                <xsl:value-of select="ancestor::rng:define[1]/@name"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="ancestor::rng:element[2]/@name"/>
                                <xsl:text> - </xsl:text>
                                <xsl:value-of select="ancestor::rng:element[1]/@name"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="parent::rng:choice/parent::rng:attribute">
                                <xsl:text> - </xsl:text>
                                <xsl:value-of
                                    select="parent::rng:choice/parent::rng:attribute/@name"/>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:text>,</xsl:text>
                        <xsl:value-of select="$random"/>
                        <xsl:text>,</xsl:text>
                        <xsl:value-of select="concat('http://w3id.org/bod-vocabs/', $random)"/>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:otherwise>
                    <!-- TXT -->
                    <!--<xsl:otherwise>
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:choose>
                        <xsl:when test="ancestor::rng:define">
                            <xsl:value-of select="ancestor::rng:define[1]/@name"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="ancestor::rng:element[2]/@name"/>
                            <xsl:text> - </xsl:text>                            
                            <xsl:value-of select="ancestor::rng:element[1]/@name"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="parent::rng:choice/parent::rng:attribute">
                            <xsl:text> - </xsl:text>
                            <xsl:value-of select="parent::rng:choice/parent::rng:attribute/@name"/>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:text>)&#10;&#13;</xsl:text>
                </xsl:otherwise>-->
                </xsl:choose>
            </xsl:for-each>
        </xsl:result-document>
    </xsl:template>





</xsl:stylesheet>
