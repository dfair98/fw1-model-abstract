/**
* ORM Abstract Gateway Layer
* @file  Base.cfc
* @author David Fairfield
* @accessors false
* @output false
*
* */
component {
    
		// ------------------------ CONSTRUCTOR ------------------------ //
	/**
	 * I am responsible for instantiating a this object
	 * @access public
	 * @returntype any
	 * @output false
	 **/ 
		function init() {
			return this;
		}

		// ------------------------ PUBLIC METHODS ------------------------ //

        /**
         * I delete an entity
         * @access public
         * @returntype void
         * @output false
         **/
            function delete(required any entity) {
                EntityDelete(arguments.entity);
            }

        /**
        * I return an entity matching an id
        * @access public
        * @returntype any
        * @output false
        **/   
            function get(required string entityName, required numeric id) {
                local.entity = EntityLoadByPK(arguments.entityName, arguments.id);
                if (IsNull(local.entity)) {
                    local.entity = new(arguments.entityName);
                }
                return local.entity;
            }

		/**
		 * I return a new entity
		 */
        /**
        * I return a new entity
        * @access public
        * @returntype any
        * @output false
        **/      
            function new(required string entityName) {
                return EntityNew(arguments.entityName);
            }


        /**
        * I save an entity
        * @access access
        * @returntype returnType
        * @output false
        **/
            function save(required any entity) {
                EntitySave(arguments.entity);
                return arguments.entity;
            }


} // end component