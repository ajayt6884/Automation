And /^go to Taxonomies$/ do
  visit(TaxonomyPage)
end

Then /^I click button NEW TAXONOMY$/ do
  on(TaxonomyPage).create_new_record
end

Then /^I specify the taxonomy name "(.*?)"$/ do  |name|
  on(TaxonomyPage).taxonomy_name = name
end

And /^submit the new form$/ do
  on(TaxonomyPage).create
end

Then /^I right click on taxonomy in tree$/ do
  on(TaxonomyPage).right_click
end

Then /^I click edit$/ do
  on(TaxonomyPage).edit_taxon
end