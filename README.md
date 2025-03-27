## Bug demonstration
[grails-data-mapping #2071](https://github.com/apache/grails-data-mapping/issues/2071)

Demonstrates an issue with the [Hibernate implementation](https://github.com/apache/grails-data-mapping/blob/00fbc39170146c6ae844c66c7e2056a4e7565ba6/grails-data-hibernate5/gorm/src/main/groovy/org/grails/orm/hibernate/AbstractHibernateGormStaticApi.groovy#L217) of the exists method on grails Domain classes.  