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
                    <title>Elegías de Teognis</title>
                     <meta charset="utf-8" lang="es" />
                         <link rel="stylesheet" href="../css/bootstrap.css" />
                             <link rel="shortcut icon" type="png" href="img/favicon.png"/>
                             <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
                             <script src="../js/bootstrap.min.js"></script>
                             <script>
                                 $(function () { 
                                 $('[data-toggle="tooltip"]').tooltip()
                                 })
                             </script>
                             <script>
                                 $(function () {
                                 $('[data-toggle="popover"]').popover()
                                 })
                             </script>
                         </head>
                         <body>
<div class="container">
      <h1 class="col-md-4 col-sm-12 col-xs-12">Elegías de Teognis </h1>
      <div class="col-md-8 col-sm-12 col-xs-12" style="padding-top: 10px;">
         <nav class="navbar.right navbar-inverse">
            <div class="container-fluid">
             <div class="navbar-header">
               <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                 <span class="icon-bar"></span>
                 <span class="icon-bar"></span>
                 <span class="icon-bar"></span>                        
              </button>
              <a class="navbar-brand" href="index.html">Eλεγείων</a>
           </div>
           <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
              <li><a href="teognisgriego.html">Texto griego</a></li>
              <li><a href="teognisespañol.html">Texto español</a></li>
              <li><a href="personalia.html"><i>Personalia</i></a></li>
              <li><a href="lugares.html">Lugares</a></li>  


              </ul>
           </div>
        </div>
     </nav>
  </div> 

   <div class="col-md-12 col-xs-12 col-sm-12">
   <h2>Eλεγείων</h2>
   
                        <xsl:apply-templates select="/TEI/text/body"/>
   </div>
</div>
</body>
</html>
</xsl:template>
    
 <xsl:template match="//head">
     <h3><xsl:value-of select="."/></h3>
 </xsl:template>

<xsl:template match="//div/div" >
    
<xsl:choose>
   
    <xsl:when test="@n='1'"   >
       

<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
 <div class="panel panel-default">
  <div class="panel-heading" role="tab" id="headingOne">
   <h4 class="panel-title">
    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
     <xsl:variable name="num" select="count(lg/l)" />
        Versos del 1 al 
      
       <xsl:value-of select="count(lg/l)"/> 
  </a>
</h4>
</div>
<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
   <div class="panel-body">
      <div class="col-md-12 col-xs-12">
         <div class="col-md-8 col-xs-12">
            <xsl:apply-templates/>
            </div>
         </div>

      </div>
   </div>
</div>
</div>
    </xsl:when>
    <xsl:when test="@n='2'"   >
        
        
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingTwo">
                <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        Versos 52-<xsl:value-of select="count(lg/l)"/>
                    </a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                <div class="panel-body">
                        <div class="col-md-12 col-xs-12">
                            <div class="col-md-8 col-xs-12">
                                <xsl:apply-templates/>
                            </div>
                        </div>
                        
                    </div>
               
            </div>
        </div>
    </xsl:when>
    <xsl:otherwise>
       
       <xsl:variable name="posicion" select="position()"/>
        
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="heading{$posicion}">
                <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse{$posicion}" aria-expanded="false" aria-controls="collapse{$posicion}">
                        Versos 52-<xsl:value-of select="count(lg/l)"/>
                    </a>
                </h4>
            </div>
            <div id="collapse{$posicion}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading{$posicion}">
                <div class="panel-body">
                    <div class="col-md-12 col-xs-12">
                        <div class="col-md-8 col-xs-12">
                                <xsl:apply-templates/>
                            </div>
                        </div>
                        
                    </div>
                </div>
        </div>
           
        
        
    </xsl:otherwise>
</xsl:choose>

</xsl:template>
    <xsl:template match="//lg">
        <xsl:apply-templates/><br></br>
    </xsl:template>
    <xsl:template match="//l">
        <p><xsl:value-of select="."/>
           
            
            <xsl:if test="@n mod 5=0" ><span style="float:right; margin-right:50px"><xsl:value-of select="@n"/></span></xsl:if></p>
        <xsl:if test="@n mod 6=0">
            
        </xsl:if>
    </xsl:template>
    
    
    

  
                </xsl:stylesheet>