class Estado < ActiveRecord::Base
	validates_uniqueness_of :ultimo, if: :ultimo

	def colores
		return [['azul',{:style => 'background-color: #3d8dbc;', :value => '#3d8dbc'}], 
		['celeste',{:style => 'background-color: #00c0ef;', :value => '#00c0ef'}], 
		['verde',{:style => 'background-color: #00a65a;', :value => '#00a65a'}], 
		['lima',{:style => 'background-color: #99c43b;', :value => '#99c43b'}],
		['ocre',{:style => 'background-color: #f39c12;', :value => '#f39c12'}],
		['amarillo',{:style => 'background-color: #fde94e;', :value => '#fde94e'}],
		['rojo',{:style => 'background-color: #f56954;', :value => '#f56954'}],
		['gris',{:style => 'background-color: #b5bbc8;', :value => '#b5bbc8'}],
		['azul-marino',{:style => 'background-color: #001F3F;', :value => '#001F3F'}],
		['aguamarina',{:style => 'background-color: #39CCCC;', :value => '#39CCCC'}],
		['púrpura',{:style => 'background-color: #605ca8;', :value => '#605ca8'}],
		['naranja',{:style => 'background-color: #ff851b;', :value => '#ff851b'}],
		['magenta',{:style => 'background-color: #D81B60;', :value => '#D81B60'}],
		['negro',{:style => 'background-color: #111111;', :value => '#111111'}]
	]
	end
end
