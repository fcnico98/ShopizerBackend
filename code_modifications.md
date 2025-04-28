
# Code Modifications

## Deprecated Method Removal

### Files Updated:

1. **BeanStreamPayment.java**
   - Replaced `productPriceUtils.getAdminFormatedAmount(store, order.getTotal())` with `productPriceUtils.getStoreFormatedAmountWithCurrency(store, order.getTotal())`.

2. **Stripe3Payment.java**
   - Replaced `productPriceUtils.getAdminFormatedAmount(store, order.getTotal())` with `productPriceUtils.getStoreFormatedAmountWithCurrency(store, order.getTotal())`.

## Static Method Update

- Made `getStoreFormatedAmountWithCurrency` method static in `ProductPriceUtils.java`.

These changes ensure that the deprecated method is no longer used and the new static method is utilized instead.