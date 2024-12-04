from django.db import models

# Kolory kwiatów
class Color(models.Model):
    color_id = models.AutoField(primary_key=True)
    color_name = models.CharField(max_length=50)

    def __str__(self):
        return self.color_name
    class Meta:
        db_table = 'color'
        managed = False
# Kwiaty
class Flower(models.Model):
    flower_id = models.AutoField(primary_key=True)
    flower_name = models.CharField(max_length=50)
    price = models.FloatField()

    def __str__(self):
        return self.flower_name
    class Meta:
        db_table = 'flower'
        managed = False
# Relacja wielu-wielu między kwiatami a kolorami
class FlowerColor(models.Model):
    flower = models.ForeignKey(Flower, on_delete=models.CASCADE)
    color = models.ForeignKey(Color, on_delete=models.CASCADE)

    class Meta:
        db_table = 'flowercolor'
        managed = False
# Klienci
class Customer(models.Model):
    customer_id = models.AutoField(primary_key=True)
    customer_contact = models.CharField(max_length=15, null=True, blank=True)
    address = models.CharField(max_length=255, null=True, blank=True)

    def __str__(self):
        return f"Customer {self.customer_id}"

    class Meta:
        db_table = 'customer'
        managed = False

# Osoby fizyczne
class Individual(models.Model):
    customer = models.OneToOneField(Customer, on_delete=models.CASCADE, primary_key=True)
    individual_name = models.CharField(max_length=255, null=True, blank=True)
    surname = models.CharField(max_length=255, null=True, blank=True)

    class Meta:
        db_table = 'individual'
        managed = False
# Firmy
class Firm(models.Model):
    customer = models.OneToOneField(Customer, on_delete=models.CASCADE, primary_key=True)
    name = models.CharField(max_length=255, null=True, blank=True)
    NIP = models.CharField(max_length=14, null=True, blank=True)

    class Meta:
        db_table = 'firm'
        managed = False

# Zamówienia
class Order(models.Model):
    order_id = models.AutoField(primary_key=True)
    total_amount = models.FloatField()
    order_date = models.DateTimeField(auto_now_add=True)
    customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, null=True)
    employee = models.ForeignKey('Employee', on_delete=models.SET_NULL, null=True, blank=True)
    delivery = models.ForeignKey('Delivery', on_delete=models.SET_NULL, null=True, blank=True)
    payment_type = models.ForeignKey('PaymentType', on_delete=models.SET_NULL, null=True, blank=True)

    class Meta:
        db_table = 'orders'
        managed = False

# Kwiaty w zamówieniach
class OrderFlower(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    flower = models.ForeignKey(Flower, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField()

    class Meta:
        db_table = 'orderflower'
        managed = False
# Dostawa
class Delivery(models.Model):
    delivery_id = models.AutoField(primary_key=True)
    delivery_data = models.DateField(null=True, blank=True)
    delivery_name = models.ForeignKey('DeliveryName', on_delete=models.SET_NULL, null=True, blank=True)
    status = models.ForeignKey('Status', on_delete=models.SET_NULL, null=True, blank=True)

    class Meta:
        db_table = 'delivery'
        managed = False


# Nazwy firm kurierskich
class DeliveryName(models.Model):
    delivery_name_id = models.AutoField(primary_key=True)
    firm_name = models.CharField(max_length=255, null=True, blank=True)

    def __str__(self):
        return self.firm_name

    class Meta:
        db_table = 'deliveryname'
        managed = False

# Typy płatności
class PaymentType(models.Model):
    payment_type_id = models.AutoField(primary_key=True)
    payment_name = models.CharField(max_length=255, null=True, blank=True)

    def __str__(self):
        return self.payment_name
    class Meta:
        db_table = 'paymenttype'
        managed = False

# Statusy zamówień
class Status(models.Model):
    status_id = models.AutoField(primary_key=True)
    status_name = models.CharField(max_length=50, null=True, blank=True)

    def __str__(self):
        return self.status_name

    class Meta:
        db_table = 'status'
        managed = False

# Pracownicy
class Employee(models.Model):
    employee_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255, null=True, blank=True)
    role = models.CharField(max_length=255, null=True, blank=True)
    supervisor = models.ForeignKey('self', on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'employee'
        managed = False