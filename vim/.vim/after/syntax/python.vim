" syn region FCall start='[[:alpha:]_]\i*\s*(' end=')' contains=FCall,Identifier
" syn match Identifier /\i*\ze\s*=[^=]/ contained
" syn keyword jsThis self
" syn region pFun matchgroup=Function start='\h\i*\(\.\h\i*\)*\s*(' end=')' contains=pFun,pythonString,pythonNumber,Identifier
" syn match Identifier /\v(\=\s*)?\zs\h\i*\ze\s*[,)]/ contained
