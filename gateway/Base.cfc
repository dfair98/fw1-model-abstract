/**
* Gateway abstract layer
* @file  model/abstract/gateway/Base.cfc
* @author David Fairfield (david.fairfield@gmail.com)
* @accessors true
* 
*/
component {
    // ------------------------ DEPENDENCY INJECTION ------------------------ //
        property beanFactory;
        property scopeService;
        property utilityService;
    
    
    // ------------------------ CONSTRUCTOR ------------------------ //	
    
        /**
         * I am responsible for Instantiating a controller instance
         * @access public
         * @returntype any
         * @output false
         **/ 
            function INIT( fw ) {
                variables.fw = fw;
                return this;
            }
    
        /**
        * I am responsible for executing code before controller call
        * @access public
        * @returntype void
        * @output false
        **/
            function BEFORE ( rc ){
                rc.startTime = getTickCount();
                rc.today = dateTimeFormat(now(),'long');
                rc.title = "";	
            }
    
        /**
        * I am responsible for executing code after controller call
        * @access public
        * @returntype void
        * @output false
        **/
            function AFTER ( rc ){
                rc.endTime = getTickCount();
            }
    
    
        /**
        * I am responsible for handling missed methods
        * @access public
        * @returntype any
        * @output false
        **/
            function ONMISSINGMETHOD(
                required string MissingMethodName, 
                required struct MissingMethodArguments
            ){}
    
    
    
    }