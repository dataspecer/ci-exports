<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:ns0="http://example.com/vocabulary#">
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/test">
    <rdf:RDF>
      <xsl:variable name="result" as="element()*">
        <xsl:call-template name="_psm-class-root"/>
      </xsl:variable>
      <xsl:for-each select="$result">
        <xsl:copy>
          <xsl:call-template name="remove-top"/>
        </xsl:copy>
      </xsl:for-each>
      <xsl:for-each select="$result//top-level/node()">
        <xsl:copy>
          <xsl:call-template name="remove-top"/>
        </xsl:copy>
      </xsl:for-each>
    </rdf:RDF>
  </xsl:template>
  <xsl:template match="@xml:lang">
    <xsl:copy-of select="."/>
  </xsl:template>
  <xsl:template name="remove-top">
    <xsl:for-each select="@*">
      <xsl:copy/>
    </xsl:for-each>
    <xsl:for-each select="node()[not(. instance of element(top-level))]">
      <xsl:copy>
        <xsl:call-template name="remove-top"/>
      </xsl:copy>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_psm-class-root">
    <xsl:param name="arc" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <rdf:Description>
      <xsl:apply-templates select="@*"/>
      <xsl:variable name="id">
        <id>
          <xsl:attribute name="rdf:nodeID">
            <xsl:value-of select="generate-id()"/>
          </xsl:attribute>
        </id>
      </xsl:variable>
      <xsl:copy-of select="$id//@*"/>
      <rdf:type rdf:resource="http://example.com/vocabulary#Test"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="must_a">
        <ns0:must_a>
          <xsl:attribute name="rdf:resource">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </ns0:must_a>
      </xsl:for-each>
      <xsl:for-each select="must_a_class_regex">
        <ns0:must_a_class_regex>
          <xsl:attribute name="rdf:resource">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </ns0:must_a_class_regex>
      </xsl:for-each>
      <xsl:for-each select="must_a_single">
        <ns0:must_a_single>
          <xsl:attribute name="rdf:resource">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </ns0:must_a_single>
      </xsl:for-each>
      <xsl:for-each select="must_a_object">
        <ns0:must_a_object>
          <xsl:call-template name="_psm-class-must_005fa_005fobject"/>
        </ns0:must_a_object>
      </xsl:for-each>
      <xsl:for-each select="at_least_one_a">
        <ns0:at_least_one_a>
          <xsl:attribute name="rdf:resource">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </ns0:at_least_one_a>
      </xsl:for-each>
      <xsl:for-each select="at_least_one_a_single">
        <ns0:at_least_one_a_single>
          <xsl:attribute name="rdf:resource">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </ns0:at_least_one_a_single>
      </xsl:for-each>
      <xsl:for-each select="at_least_one_a_object">
        <ns0:at_least_one_a_object>
          <xsl:call-template name="_psm-class-at_005fleast_005fone_005fa_005fobject"/>
        </ns0:at_least_one_a_object>
      </xsl:for-each>
      <xsl:for-each select="at_least_one_a_and_b">
        <ns0:at_least_one_a_and_b>
          <xsl:attribute name="rdf:resource">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </ns0:at_least_one_a_and_b>
      </xsl:for-each>
      <xsl:for-each select="recommended_a_default">
        <ns0:recommended_a_default>
          <xsl:attribute name="rdf:resource">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </ns0:recommended_a_default>
      </xsl:for-each>
      <xsl:for-each select="recommended_a_require">
        <ns0:recommended_a_require>
          <xsl:attribute name="rdf:resource">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </ns0:recommended_a_require>
      </xsl:for-each>
      <xsl:for-each select="recommended_a_restrict">
        <ns0:recommended_a_restrict>
          <xsl:attribute name="rdf:resource">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </ns0:recommended_a_restrict>
      </xsl:for-each>
      <xsl:for-each select="recommended_a_both">
        <ns0:recommended_a_both>
          <xsl:attribute name="rdf:resource">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </ns0:recommended_a_both>
      </xsl:for-each>
      <xsl:for-each select="may_a">
        <ns0:may_a>
          <xsl:attribute name="rdf:resource">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </ns0:may_a>
      </xsl:for-each>
      <xsl:for-each select="must_without_pattern">
        <ns0:must_without_pattern>
          <xsl:attribute name="rdf:resource">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </ns0:must_without_pattern>
      </xsl:for-each>
      <xsl:for-each select="at_least_one_a_recommended_b_require">
        <ns0:at_least_one_a_recommended_b_require>
          <xsl:attribute name="rdf:resource">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </ns0:at_least_one_a_recommended_b_require>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_psm-class-must_005fa_005fobject">
    <xsl:param name="arc" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <rdf:Description>
      <xsl:apply-templates select="@*"/>
      <xsl:variable name="id">
        <id>
          <xsl:choose>
            <xsl:when test="iri and not($no_iri)">
              <xsl:attribute name="rdf:about">
                <xsl:value-of select="iri"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="rdf:nodeID">
                <xsl:value-of select="generate-id()"/>
              </xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
        </id>
      </xsl:variable>
      <xsl:copy-of select="$id//@*"/>
      <rdf:type rdf:resource="http://example.com/vocabulary#Value_must_a_object"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="label">
        <ns0:label_must_a_object>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:label_must_a_object>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_psm-class-at_005fleast_005fone_005fa_005fobject">
    <xsl:param name="arc" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <rdf:Description>
      <xsl:apply-templates select="@*"/>
      <xsl:variable name="id">
        <id>
          <xsl:choose>
            <xsl:when test="iri and not($no_iri)">
              <xsl:attribute name="rdf:about">
                <xsl:value-of select="iri"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="rdf:nodeID">
                <xsl:value-of select="generate-id()"/>
              </xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
        </id>
      </xsl:variable>
      <xsl:copy-of select="$id//@*"/>
      <rdf:type rdf:resource="http://example.com/vocabulary#Value_at_least_one_a_object"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="label">
        <ns0:label_at_least_one_a_object>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:label_at_least_one_a_object>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
