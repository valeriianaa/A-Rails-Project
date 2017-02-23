Given(/^I have no paises$/) do
	Pais..delete.all
end

Then(/^I should have ([0-9]+) pais$/) do |count|
	Pais.count.should == count.to_i
end