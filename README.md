&#x202b; در این پروژه میخواهیم از الگوریتم SOM برای حل مسئله فروشنده دوره گرد  (TSP) به زبان متلب استفاده کنیم. 

&#x202b; هدف یافتن
کوتاهترین توری است که هر شهر را دقیقا یک بار ملاقات کرده و آنگاه به شهر شروع بازگردد (دور همیلتونی). طول یک تور، مجموع
طول تمامی یالهای روی آن تور و طول هر یال فاصله اقلیدسی دو نقطه همسایه تعریف شده است. برای مثال فرض کنید 13 شهر
A ، B ،... ،  J با 13 نقطه روی یک صفحه دوبعدی نمایش داده شده اند.

A: (0.556, 0.560) B: (0.099, 0.775)

C: (0.895, 0.546) D: (0.059, 0.864)

E: (0.208, 0.748) F: (0.055, 0.217)

G: (0.434, 0.660) H: (0.835, 0.696)

I: (0.679, 0.210) J: (0.126, 0.597)


&#x202b; در این مثال طول تور بهینه 2.7487 است.

&#x202b; پارامترها در این پروژه به صورت زیر تنظیم شده اند:

&#x202b; مقداردهی اولیه وزنها: مقادیر وزنها بهطور تصادفی از بازه [-0.1, 0.1] انتخاب شده اند.

&#x202b; نرخ یادگیری: از 0.5 شروع کرده و در هر اپیزود به اندازه 0.005 آن را کاهش داده شده اند.

&#x202b; .شعاع همسایگی: از 2 شروع کرده و پس از 93 اپیزود یک واحد کاهش یابد و پس از 133 اپیزود صفر شده است
