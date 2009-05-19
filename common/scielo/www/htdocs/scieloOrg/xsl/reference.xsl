<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

	<xsl:variable name="lang" select="/root/vars/lang"/>
	<xsl:variable name="applserver" select="/root/vars/applserver"/>
	<xsl:variable name="texts" select="document('file:///home/scielo/www/htdocs/applications/scielo-org/xml/texts.xml')/texts/language[@id = $lang]"/>



	<xsl:template match="/">
		<div class="articleList">
			<ul>
				<xsl:apply-templates select="//record"/>
				<xsl:apply-templates select="//Isis_Total[occ = 0]" mode="notFound"/>
			</ul>
		</div>
	</xsl:template>

	<xsl:template match="occ" mode="notFound">
		<xsl:value-of select="$texts/text[find='notFound']/replace"/>
	</xsl:template>
	
	<xsl:template match="record">
		<xsl:apply-templates select="field[@tag =704 ]/occ"/>[ <a href="http://{$applserver}/scielo.php?pid={field[@tag = 880]/occ}&amp;lng={$lang}&amp;script=sci_reflinks"><xsl:value-of select="$texts/text[find='findReferenceOnLine']/replace"/></a> ]<br/><br/>
	</xsl:template>
	

</xsl:stylesheet>