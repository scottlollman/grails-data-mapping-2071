<!doctype html>
<html><head>
<style>
	inline-code, inline-block-code {
		font-family: "Courier New";
		border:1px solid rgba(0,0,0,0.1);
		padding-left:2px;
		padding-right:2px;
	}
	inline-code { display:inline; }
	inline-block-code { display:inline-block; white-space: pre }
</style>
</head><body>
This project demonstrates
<a href="https://github.com/apache/grails-data-mapping/issues/2071">grails-data-mapping #2071</a>.<br>
A bootstrap class exercises the issue during startup.  Check the logs for the SQL.

<br><br>

When calling
<inline-code>
	<a href="https://github.com/apache/grails-data-mapping/blob/00fbc39170146c6ae844c66c7e2056a4e7565ba6/grails-datastore-gorm/src/main/groovy/org/grails/datastore/gorm/GormEntity.groovy#L662">
	GormEntity.exists( # )</a></inline-code>
the
<a href="https://github.com/apache/grails-data-mapping/blob/00fbc39170146c6ae844c66c7e2056a4e7565ba6/grails-data-hibernate5/gorm/src/main/groovy/org/grails/orm/hibernate/AbstractHibernateGormStaticApi.groovy#L217">
	hibernate implementation</a>
generates a query with an unnecessary and unconstrained join.

<br><br>

The exact generated SQL will depend on the database syntax.  Here are 2 examples: <br><br>

<inline-block-code>select
	count(example1_.id) as col_0_0_
from
	example example0_
cross join
	example example1_
where
	example0_.id=0 limit ?</inline-block-code>

<inline-block-code>select
	count(example1_.id) as col_0_0_
from
	example example0_,
	example example1_
where
	example0_.id=0 limit ?</inline-block-code>
<br><br>

<g:if test="${exception}">
	<g:if env="development">
		<g:if test="${Throwable.isInstance(exception)}">
			<g:renderException exception="${exception}" />
		</g:if>
		<g:elseif test="${request.getAttribute('javax.servlet.error.exception')}">
			<g:renderException exception="${request.getAttribute('javax.servlet.error.exception')}" />
		</g:elseif>
		<g:else>
			<ul class="errors">
				<li>An error has occurred</li>
				<li>Exception: ${exception}</li>
				<li>Message: ${message}</li>
				<li>Path: ${path}</li>
			</ul>
		</g:else>
	</g:if>
	<g:else>
		<ul class="errors">
			<li>An error has occurred</li>
		</ul>
	</g:else>
</g:if>
</body></html>
