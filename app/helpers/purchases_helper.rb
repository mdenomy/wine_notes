module PurchasesHelper
  def purchase_title(wine)
     "Record purchase for " + wine.full_name unless wine.nil?
  end
end