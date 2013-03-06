// ----------------------------------------------------------------------------
// markItUp!
// ----------------------------------------------------------------------------
// Copyright (C) 2011 Jay Salvat
// http://markitup.jaysalvat.com/
// ----------------------------------------------------------------------------
// Html tags
// http://en.wikipedia.org/wiki/html
// ----------------------------------------------------------------------------
// Basic set. Feel free to add more tags
// ----------------------------------------------------------------------------
var adminSettings = {
	onShiftEnter:  	{keepDefault:false, replaceWith:'<br />\n'},
	onCtrlEnter:  	{keepDefault:false, openWith:'\n<p>', closeWith:'</p>'},
	onTab:          {keepDefault:false, replaceWith:'    '},
	markupSet:  [ 	
		{name:'Жирный текст', key:'B', openWith:'(!(<strong>|!|<b>)!)', closeWith:'(!(</strong>|!|</b>)!)' },
		{name:'Курсив', key:'I', openWith:'(!(<em>|!|<i>)!)', closeWith:'(!(</em>|!|</i>)!)'  },
		{name:'Зачеркнутый', key:'S', openWith:'<del>', closeWith:'</del>' },
		{separator:'---------------' },
        {name:'Картинка', key:'P', replaceWith:'<img src="[![Source:!:http://]!]" alt="[![Alternative text]!]" />' },
		{name:'Ссылка', key:'L', openWith:'<a href="[![Link:!:http://]!]"(!( title="[![Title]!]")!)>', closeWith:'</a>', placeHolder:'Your text to link...' },
		{separator:'---------------' },
		{name:'Обычный список', openWith:'    <li>', closeWith:'</li>', multiline:true, openBlockWith:'<ul>\n', closeBlockWith:'\n</ul>', className: 'markItUpButton7'},
		{name:'Нумерованный список', openWith:'    <li>', closeWith:'</li>', multiline:true, openBlockWith:'<ol>\n', closeBlockWith:'\n</ol>', className: 'markItUpButton6'},
		{separator:'---------------' },
		{name:'Код', openWith:'<script type="syntaxhighlighter" class="brush: [![Язык:!():]!]"><![CDATA[', closeWith:']]></script>', className: 'markItUpButton11'},
		{name:'Разделитель', replaceWith: '\n###separator###\n' },
		{name:'Очистить', className:'clean', replaceWith:function(markitup) { return markitup.selection.replace(/<(.*?)>/g, "") } },
		{name:'Превью', className:'preview',  call:'preview'}
	]
}

var userSettings = {
	onShiftEnter:  	{keepDefault:false, replaceWith:'<br />\n'},
	onEnter:  	{keepDefault:false, replaceWith:'\n'},
	previewParserPath: '', // path to your BBCode parser
	markupSet: [
		{name:'Жирный', key:'B', openWith:'[b]', closeWith:'[/b]'},
		{name:'Курсив', key:'I', openWith:'[i]', closeWith:'[/i]'},
		{name:'Подчеркнутый', key:'U', openWith:'[u]', closeWith:'[/u]'},
		{separator:'---------------' },
		{name:'Ссылка', key:'L', openWith:'[url=[![Ссылка:]!]]', closeWith:'[/url]', placeHolder:'Ваша ссылка...'},
		{separator:'---------------' },
		{name:'Размер текста', key:'S', openWith:'[size=[![Text size]!]]', closeWith:'[/size]',
		dropMenu :[
			{name:'Большой', openWith:'[size=200]', closeWith:'[/size]' },
			{name:'Нормальный', openWith:'[size=100]', closeWith:'[/size]' },
			{name:'Маленький', openWith:'[size=50]', closeWith:'[/size]' }
		], className: 'markItUpButton6'},
		{separator:'---------------' },
		{name:'Простой список', openWith:'[list]\n', closeWith:'\n[/list]', className: 'markItUpButton7'},
		{name:'Нумерованный список', openWith:'[list=[![Начальный номер]!]]\n', closeWith:'\n[/list]', className: 'markItUpButton8'},
		{name:'Элемент списка', openWith:'[*] ', className: 'markItUpButton9'},
		{separator:'---------------' },
		{name:'Цитата', openWith:'[quote]', closeWith:'[/quote]', className: 'markItUpButton10'},
		{name:'Код', openWith:'[synt=[![Синтаксис(ruby, php, js...):]!]]\n', closeWith:'[/synt]', className: 'markItUpButton11'},
		{separator:'---------------' },
		{name:'Очистить', className:"clean", replaceWith:function(markitup) { return markitup.selection.replace(/\[(.*?)\]/g, "") }, className: 'markItUpButton12 clean' }
	]
}