/**
* ORM Abstract Service Layer
* @file  model/abstract/orm/service/Base.cfc
* @author David Fairfield
* @accessors true
* @output false
*
* */
component {

	// ------------------------ DEPENDENCY INJECTION ------------------------ //

	property beanfactory;
    property Validator;
        
// ------------------------ CONSTRUCTOR ------------------------ //	

	/**
	 * I am responsible for instantiating a service object
	 * @access public
	 * @returntype any
	 * @output false
	 **/ 
     function init( ) {
        variables.NL = CreateObject("java", "java.lang.System").getProperty("line.separator");
        return this;
    }

// ------------------------ PUBLIC METHODS ------------------------ //

    /**
    *  I return an entity validator 
    * @access public
    * @returntype any
    * @output false
    **/
        function getValidator(required any Entity) {
            return variables.Validator.getValidator(theObject = arguments.Entity);
        }


    /**
    * I am responsible for populating an entity
    * @access public
    * @returntype void
    * @output false
    **/
        function populate(
            required any Entity, 
            required struct memento, 
            boolean trustedSetter = false, 
            string include = "", 
            string exclude = ""
        ){
            for (local.key in arguments.memento) {
                local.populate = true;
                if (Len(Trim(arguments.include)) && !ListFindNoCase(arguments.include, local.key)) {
                    local.populate = false;
                }
                if (Len(Trim(arguments.exclude)) && ListFindNoCase(arguments.exclude, local.key)) {
                    local.populate = false;
                }
                if (local.populate && (StructKeyExists(arguments.Entity, "set" & local.key) || arguments.trustedSetter)) {
                    var arguments.entity.dynFunction = arguments.entity["set#local.key#"];
                    arguments.entity.dynFunction(arguments.memento[local.key]);
                }
            }
        }

    /**
    * I am responsible for handling missed methods
    * @access public
    * @returntype any
    * @output false
    **/
        function onMissingMethod(
            required string MissingMethodName, 
            required struct MissingMethodArguments
        ){}



}