
### Code Modifications

1. **PricingServiceImpl.java**
   - Replaced `getAdminFormatedAmount` with `getStoreFormatedAmountWithCurrency`.

2. **StripePayment.java**
   - Replaced `getAdminFormatedAmount` with `getStoreFormatedAmountWithCurrency` in `authorize`, `authorizeAndCapture`, and `refund` methods.

3. **Stripe3Payment.java**
   - Replaced `getAdminFormatedAmount` with `getStoreFormatedAmountWithCurrency` in `capture`, `authorizeAndCapture`, and `refund` methods.

4. **BeanStreamPayment.java**
   - Replaced `getAdminFormatedAmount` with `getStoreFormatedAmountWithCurrency` in `capture`, `refund`, and `processTransaction` methods.

5. **USPSShippingQuote.java**
   - Replaced `getAdminFormatedAmount` with `getStoreFormatedAmountWithCurrency` in the `getShippingQuotes` method.

6. **ProductPriceUtils.java**
   - Made `getStoreFormatedAmountWithCurrency` method static.