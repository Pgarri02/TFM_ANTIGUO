<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all"
    version="2.0">
  <xsl:output method="html" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes" />
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Elegías de Teognis. TFM</title>
                <meta charset="utf-8" lang="es"/>
                <link href="princesa.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <div style="display:table" class="informacion">
                    <div style="display:table-row">
                        <div class="celda-titulo">Título</div>
                        <div class="celda-dato">
                            
                            <xsl:for-each  select="TEI/teiHeader/fileDesc/titleStmt/title" >
                                
                                <xsl:value-of select="."></xsl:value-of>
                                
                            </xsl:for-each>
                            
                            
                        </div>
                    </div>
                    <div style="display:table-row">
                        <div class="celda-titulo">Autor</div>
                        <div class="celda-dato">
                            <xsl:variable name="viaf" select="TEI/teiHeader/fileDesc/titleStmt/author/ptr/@target"/>
                            <a href="{$viaf}" target="new">
                            <xsl:value-of select="TEI/teiHeader/fileDesc/titleStmt/author"/></a>
                            
                        </div>
                    </div>
                    
                    <div style="display:table-row; ">
                        <div class="celda-titulo">Publicado en</div>
                        <div class="celda-dato">
                            <xsl:value-of select="TEI/teiHeader/fileDesc/publicationStmt/p"/><br/>
                           
                        </div>
                    </div>
                </div>
                
                
                
                
                
            <div class="elegías">    
                <xsl:apply-templates select="/TEI/text/body"/></div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="//head">
        <h1><xsl:value-of select="."/></h1>
    </xsl:template>
    

    
  
    <xsl:template match="//lg">
        <p><xsl:value-of select="."/>  <xsl:if test="@n mod 5=0" ><span style="float:right; margin-right:50px"><xsl:value-of select="@n"/></span></xsl:if></p>
        <xsl:if test="@n mod 6=0">
            <br/><br/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="//signed">
        <em><xsl:value-of select="."/></em> <br/><br/><br/>  
    </xsl:template>
    
</xsl:stylesheet>