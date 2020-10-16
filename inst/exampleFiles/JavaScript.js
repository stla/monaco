// try to hover the 'zzz' argument
function hello(zzz) {
alert('Hello world!')
}

// right-click on 'hello' and 'Go to Definition'
$('#sayHello').on("click", function(){
              hello();
})

// right-click and try 'Prettify'
var json = [
      {array: [0,1,2]},
      {f: function(arg){return `Call: f(${arg})`}}
]

/*
Before doing a change, you can bookmark the
current contents to restore it later: use the
context menu or the keyboard shortcuts.
*/
