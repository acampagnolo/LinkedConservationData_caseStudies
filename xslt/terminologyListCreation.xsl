<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xpath-default-namespace="rng" xmlns:rng="http://relaxng.org/ns/structure/1.0" exclude-result-prefixes="rng" >
    
    <xsl:output method="text" xml:space="default"/>
    
    <xsl:template match="/">        
        <xsl:for-each select="//rng:value">
            <xsl:choose>
                <xsl:when test=". = 'NK'"/>
                <xsl:when test=". = 'other'"/>
                <xsl:when test=". = 'yes'"/>
                <xsl:when test=". = 'no'"/>
                <xsl:otherwise>
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
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        
    </xsl:template>
    
    
    
    
    
</xsl:stylesheet>