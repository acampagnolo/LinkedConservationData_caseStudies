<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xpath-default-namespace="rng"
    xmlns:rng="http://relaxng.org/ns/structure/1.0" exclude-result-prefixes="rng xs" version="2.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="//rng:element">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:choose>
                <xsl:when test=".[not(@name = 'conservationReport')]">
                    <xsl:element name="attribute" namespace="http://relaxng.org/ns/structure/1.0">
                        <xsl:attribute name="name">
                            <xsl:text>id</xsl:text>
                        </xsl:attribute>
                        <xsl:element name="data" namespace="http://relaxng.org/ns/structure/1.0">
                            <xsl:attribute name="type">
                                <xsl:text>NMTOKEN</xsl:text>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
            </xsl:choose>
            <xsl:element name="optional" namespace="http://relaxng.org/ns/structure/1.0">
                <xsl:element name="attribute" namespace="http://relaxng.org/ns/structure/1.0">
                    <xsl:attribute name="name">
                        <xsl:text>localURI</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="data" namespace="http://relaxng.org/ns/structure/1.0">
                        <xsl:attribute name="type">
                            <xsl:text>anyURI</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
            <xsl:element name="optional" namespace="http://relaxng.org/ns/structure/1.0">
                <xsl:element name="attribute" namespace="http://relaxng.org/ns/structure/1.0">
                    <xsl:attribute name="name">
                        <xsl:text>URI</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="data" namespace="http://relaxng.org/ns/structure/1.0">
                        <xsl:attribute name="type">
                            <xsl:text>anyURI</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
            <xsl:element name="optional" namespace="http://relaxng.org/ns/structure/1.0">
                <xsl:element name="attribute" namespace="http://relaxng.org/ns/structure/1.0">
                    <xsl:attribute name="name">
                        <xsl:text>label</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="text" namespace="http://relaxng.org/ns/structure/1.0"/>
                </xsl:element>
            </xsl:element>
            <!--<rng:optional>
                <rng:attribute name="URI">
                    <rng:data type="anyURI"/>
                </rng:attribute>
                <rng:attribute name="label">
                    <rng:text/>
                </rng:attribute>
            </rng:optional>-->
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
