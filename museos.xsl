<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8"/>
<!-- Autores: Omar Alonso, Ignacio Rodriguez y Joaquin Camps-->
  <xsl:template match="/">    <!--RAIZ-->
    <xsl:element name="html">
      <xsl:element name="head">
        <xsl:element name="title">
          <xsl:text>Lista de Exposiciones</xsl:text>
          <link rel="stylesheet" type="text/css" href="museo.css"/>
        </xsl:element>
      </xsl:element>      <!-- head-->
    <xsl:element name="body">   <!-- Inicio Body-->
        <xsl:element name="h1">
            <xsl:text>Informacion sobre exposiciones</xsl:text>
        </xsl:element>
        <xsl:for-each select="obrasArte/exposiciones/exposicion"> <!--Inicio for-each -->
            <xsl:element name="h2">
                <xsl:text>Exposicion:</xsl:text>
            </xsl:element>
            <xsl:element name="ul">
                <xsl:for-each select="obras/obra">
                    <xsl:element name="li">
                        <xsl:value-of select="@idObr"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
            <xsl:element name="p">
                <xsl:text>Museo:</xsl:text>
                <xsl:value-of select="museo/@idMus"/>
            </xsl:element>
            <xsl:choose>
                <xsl:when test="fechas">
                    <xsl:element name="p"> <!--Inicio parrafo -->
                        <xsl:text>Fechas:</xsl:text>
                            <xsl:element name="ul"> <!--inicio ul -->
                                <xsl:element name="li"> <!--li inicio-->
                                    <xsl:text>Inicio: </xsl:text>
                                    <xsl:value-of select="fechas/inicio"/>
                                </xsl:element> <!--li inicio -->
                                <xsl:element name="li">  <!--li inicio -->
                                    <xsl:text>Fin: </xsl:text>
                                    <xsl:value-of select="fechas/fin"/>
                                </xsl:element> <!--li fin -->
                            </xsl:element> <!--fin ul-->
                    </xsl:element> <!-- final parrafo-->
                </xsl:when>
                <xsl:otherwise> <!-- Otro caso-->
                    <xsl:element name="p">
                        <xsl:text>Fechas no especificadas</xsl:text>
                    </xsl:element>
                </xsl:otherwise> <!-- Fin otro caso-->
            </xsl:choose>
            <xsl:element name="p">
                <xsl:text>Horario: </xsl:text>
                <xsl:value-of select="horario"/>
            </xsl:element>
        </xsl:for-each> <!-- Final for-each-->
    </xsl:element>      <!-- body-->
    </xsl:element>    <!-- HTML-->
</xsl:template>
</xsl:stylesheet>