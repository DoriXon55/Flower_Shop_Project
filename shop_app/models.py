from django.db import models

# Kolory kwiatów
class Color(models.Model):
    color_id = models.AutoField(primary_key=True)
    color_name = models.CharField(max_length=50)

    def __str__(self):
        return self.color_name

# Kwiaty
class Flower(models.Model):
    flower_id = models.AutoField(primary_key=True)
    flower_name = models.CharField(max_length=50)
    price = models.FloatField()

    def __str__(self):
        return self.flower_name

# Relacja wielu-wielu między kwiatami a kolorami
class FlowerColor(models.Model):
    flower = models.ForeignKey(Flower, on_delete=models.CASCADE)
    color = models.ForeignKey(Color, on_delete=models.CASCADE)

    class Meta:
        unique_together = ('flower', 'color')

# Klienci
class Customer(models.Model):
    customer_id = models.AutoField(primary_key=True)
    customer_contact = models.CharField(max_length=15, null=True, blank=True)
    address = models.CharField(max_length=255, null=True, blank=True)

    def __str__(self):
        return f"Customer {self.customer_id}"

# Osoby fizyczne
class Individual(models.Model):
    customer = models.OneToOneField(Customer, on_delete=models.CASCADE, primary_key=True)
    individual_name = models.CharField(max_length=255, null=True, blank=True)
    surname = models.CharField(max_length=255, null=True, blank=True)

# Firmy
class Firm(models.Model):
    customer = models.OneToOneField(Customer, on_delete=models.CASCADE, primary_key=True)
    name = models.CharField(max_length=255, null=True, blank=True)
    NIP = models.CharField(max_length=14, null=True, blank=True)

# Zamówienia
class Order(models.Model):
    order_id = models.AutoField(primary_key=True)
    total_amount = models.FloatField()
    order_date = models.DateTimeField(auto_now_add=True)
    customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, null=True)
    employee = models.ForeignKey('Employee', on_delete=models.SET_NULL, null=True, blank=True)
    delivery = models.ForeignKey('Delivery', on_delete=models.SET_NULL, null=True, blank=True)
    payment_type = models.ForeignKey('PaymentType', on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return f"Order {self.order_id}"

# Kwiaty w zamówieniach
class OrderFlower(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    flower = models.ForeignKey(Flower, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField()

    class Meta:
        unique_together = ('order', 'flower')

# Dostawa
class Delivery(models.Model):
    delivery_id = models.AutoField(primary_key=True)
    delivery_data = models.DateField(null=True, blank=True)
    delivery_name = models.ForeignKey('DeliveryName', on_delete=models.SET_NULL, null=True, blank=True)
    status = models.ForeignKey('Status', on_delete=models.SET_NULL, null=True, blank=True)

# Nazwy firm kurierskich
class DeliveryName(models.Model):
    delivery_name_id = models.AutoField(primary_key=True)
    firm_name = models.CharField(max_length=255, null=True, blank=True)

    def __str__(self):
        return self.firm_name

# Typy płatności
class PaymentType(models.Model):
    payment_type_id = models.AutoField(primary_key=True)
    payment_name = models.CharField(max_length=255, null=True, blank=True)

    def __str__(self):
        return self.payment_name

# Statusy zamówień
class Status(models.Model):
    status_id = models.AutoField(primary_key=True)
    status_name = models.CharField(max_length=50, null=True, blank=True)

    def __str__(self):
        return self.status_name

# Pracownicy
class Employee(models.Model):
    employee_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255, null=True, blank=True)
    role = models.CharField(max_length=255, null=True, blank=True)
    supervisor = models.ForeignKey('self', on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return self.name
