# Code Modifications

## Files Modified

1. **BeanStreamPayment.java**
   - Replaced `getAdminFormatedAmount(store, order.getTotal())` with `getStoreFormatedAmountWithCurrency(store, order.getTotal())`.

2. **PayPalRestPayment.java**
   - Updated commented-out code to replace `getAdminFormatedAmount(store, amount)` with `getStoreFormatedAmountWithCurrency(store, amount)`.

3. **Stripe3Payment.java**
   - Replaced `getAdminFormatedAmount(store, order.getTotal())` with `getStoreFormatedAmountWithCurrency(store, order.getTotal())`.

4. **ProductPriceUtils.java**
   - Made `getStoreFormatedAmountWithCurrency` method static.

## Summary

- Deprecated method `getAdminFormatedAmount(MerchantStore, BigDecimal)` was replaced with `getStoreFormatedAmountWithCurrency` in all identified internal callers.
- The `getStoreFormatedAmountWithCurrency` method was made static to align with the new usage requirements.

