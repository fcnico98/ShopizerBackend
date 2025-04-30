# Code Modifications

## Deprecated Method Removal

1. **BeanStreamPayment.java**
   - Replaced `getAdminFormatedAmount(store, order.getTotal())` with `getStoreFormatedAmountWithCurrency(store, order.getTotal())`.

2. **Stripe3Payment.java**
   - Replaced `getAdminFormatedAmount(store, order.getTotal())` with `getStoreFormatedAmountWithCurrency(store, order.getTotal())`.

3. **StripePayment.java**
   - Replaced `getAdminFormatedAmount(store, amount)` with `getStoreFormatedAmountWithCurrency(store, amount)`.

## Method Update

- **ProductPriceUtils.java**
  - Made `getStoreFormatedAmountWithCurrency` method static.

These changes ensure that the deprecated method is no longer used and the new method is static for better utility access.

