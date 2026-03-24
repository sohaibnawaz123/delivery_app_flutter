# Stripe optional push provisioning / TapAndPay integrations.
# Avoid R8 hard-failures when classes are referenced but not used.
-dontwarn com.google.android.gms.tapandpay.**
-dontwarn com.stripe.android.pushProvisioning.**

# Keep Stripe Push Provisioning classes when available.
-keep class com.stripe.android.pushProvisioning.** { *; }
-keepclassmembers class com.stripe.android.pushProvisioning.** { *; }
-keepclassmembers class com.google.android.gms.tapandpay.** { *; }
