# Code Modifications

## Deprecated Method Removal

- **Method**: `getAdminFormatedAmount(com.salesmanager.core.model.merchant.MerchantStore,java.math.BigDecimal)`
- **Class**: `ProductPriceUtils`
- **Action**: Removed all occurrences of the deprecated method and replaced them with `getStoreFormatedAmountWithCurrency`.

## Files Updated

1. **BeanStreamPayment.java**
   - Replaced `getAdminFormatedAmount` with `getStoreFormatedAmountWithCurrency`.

2. **Stripe3Payment.java**
   - Replaced `getAdminFormatedAmount` with `getStoreFormatedAmountWithCurrency`.

3. **StripePayment.java**
   - Replaced `getAdminFormatedAmount` with `getStoreFormatedAmountWithCurrency`.

4. **USPSShippingQuote.java**
   - Replaced `getAdminFormatedAmount` with `getStoreFormatedAmountWithCurrency`.

## Method Update

- **Method**: `getStoreFormatedAmountWithCurrency`
- **Class**: `ProductPriceUtils`
- **Action**: Made the method static to allow usage without an instance of `ProductPriceUtils`.

