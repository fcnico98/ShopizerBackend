
### Code Modifications

1. **PricingServiceImpl.java**
   - Replaced the call to `getAdminFormatedAmount` with `getStoreFormatedAmountWithCurrency`.

2. **StripePayment.java**
   - Replaced all calls to `getAdminFormatedAmount` with `getStoreFormatedAmountWithCurrency`.

3. **Stripe3Payment.java**
   - Replaced all calls to `getAdminFormatedAmount` with `getStoreFormatedAmountWithCurrency`.

4. **BeanStreamPayment.java**
   - Replaced all calls to `getAdminFormatedAmount` with `getStoreFormatedAmountWithCurrency`.

5. **USPSShippingQuote.java**
   - Replaced the call to `getAdminFormatedAmount` with `getStoreFormatedAmountWithCurrency`.

6. **ProductPriceUtils.java**
   - Made the `getStoreFormatedAmountWithCurrency` method static.