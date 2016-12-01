﻿DELETE FROM auth.menu_access_policy
WHERE menu_id IN
(
    SELECT menu_id FROM core.menus
    WHERE app_name = 'Sales'
);

DELETE FROM auth.group_menu_access_policy
WHERE menu_id IN
(
    SELECT menu_id FROM core.menus
    WHERE app_name = 'Sales'
);

DELETE FROM core.menus
WHERE app_name = 'Sales';


SELECT * FROM core.create_app('Sales', 'Sales', '1.0', 'MixERP Inc.', 'December 1, 2015', 'shipping blue', '/dashboard/sales/tasks/entry', NULL::text[]);

SELECT * FROM core.create_menu('Sales', 'Tasks', '', 'lightning', '');
SELECT * FROM core.create_menu('Sales', 'Opening Cash', '/dashboard/sales/tasks/opening-cash', 'money', 'Tasks');
SELECT * FROM core.create_menu('Sales', 'Sales Entry', '/dashboard/sales/tasks/entry', 'write', 'Tasks');
SELECT * FROM core.create_menu('Sales', 'Sales Returns', '/dashboard/sales/tasks/return', 'minus square', 'Tasks');
SELECT * FROM core.create_menu('Sales', 'Sales Quotation', '/dashboard/sales/tasks/quotation', 'quote left', 'Tasks');
SELECT * FROM core.create_menu('Sales', 'Sales Orders', '/dashboard/sales/tasks/order', 'file text outline', 'Tasks');
SELECT * FROM core.create_menu('Sales', 'Sales Entry Verification', '/dashboard/sales/tasks/entry/verification', 'checkmark', 'Tasks');
SELECT * FROM core.create_menu('Sales', 'Sales Return Verification', '/dashboard/sales/tasks/return/verification', 'checkmark box', 'Tasks');
--SELECT * FROM core.create_menu('Sales', 'Check Clearing', '/dashboard/sales/tasks/checks/checks-clearing', 'minus square outline', 'Tasks');
SELECT * FROM core.create_menu('Sales', 'EOD', '/dashboard/sales/tasks/eod', 'money', 'Tasks');

SELECT * FROM core.create_menu('Sales', 'Customer Loyalty', 'square outline', 'user', '');
SELECT * FROM core.create_menu('Sales', 'Gift Cards', '/dashboard/sales/loyalty/gift-cards', 'gift', 'Customer Loyalty');
SELECT * FROM core.create_menu('Sales', 'Add Gift Card Fund', '/dashboard/loyalty/tasks/gift-cards/add-fund', 'pound', 'Customer Loyalty');
SELECT * FROM core.create_menu('Sales', 'Verify Gift Card Fund', '/dashboard/loyalty/tasks/gift-cards/add-fund/verification', 'checkmark', 'Customer Loyalty');
SELECT * FROM core.create_menu('Sales', 'Sales Coupons', '/dashboard/sales/loyalty/coupons', 'browser', 'Customer Loyalty');
--SELECT * FROM core.create_menu('Sales', 'Loyalty Point Configuration', '/dashboard/sales/loyalty/points', 'selected radio', 'Customer Loyalty');

SELECT * FROM core.create_menu('Sales', 'Setup', 'square outline', 'configure', '');
SELECT * FROM core.create_menu('Sales', 'Customer Types', '/dashboard/sales/setup/customer-types', 'child', 'Setup');
SELECT * FROM core.create_menu('Sales', 'Customers', '/dashboard/sales/setup/customers', 'street view', 'Setup');
SELECT * FROM core.create_menu('Sales', 'Price Types', '/dashboard/sales/setup/price-types', 'ruble', 'Setup');
SELECT * FROM core.create_menu('Sales', 'Selling Prices', '/dashboard/sales/setup/selling-prices', 'in cart', 'Setup');
SELECT * FROM core.create_menu('Sales', 'Late Fee', '/dashboard/sales/setup/late-fee', 'alarm mute', 'Setup');
SELECT * FROM core.create_menu('Sales', 'Payment Terms', '/dashboard/sales/setup/payment-terms', 'checked calendar', 'Setup');
SELECT * FROM core.create_menu('Sales', 'Cashiers', '/dashboard/sales/setup/cashiers', 'male', 'Setup');

SELECT * FROM core.create_menu('Sales', 'Reports', '', 'block layout', '');
SELECT * FROM core.create_menu('Sales', 'All Gift Cards', '/dashboard/sales/reports/gift-cards/account-statement', 'certificate', 'Reports');
SELECT * FROM core.create_menu('Sales', 'Gift Card Usage Statement', '/dashboard/sales/reports/gift-cards/account-statement', 'columns', 'Reports');
SELECT * FROM core.create_menu('Sales', 'Customer Account Statement', '/dashboard/sales/reports/customer/account-statement', 'content', 'Reports');
SELECT * FROM core.create_menu('Sales', 'Credit Statement', '/dashboard/sales/reports/credit-statement', 'newspaper', 'Reports');
SELECT * FROM core.create_menu('Sales', 'Top Selling Items', '/dashboard/sales/reports/sales-account-statement', 'map signs', 'Reports');
SELECT * FROM core.create_menu('Sales', 'Sales by Office', '/dashboard/sales/reports/sales-account-statement', 'building', 'Reports');


SELECT * FROM auth.create_app_menu_policy
(
    'Admin', 
    core.get_office_id_by_office_name('Default'), 
    'Sales',
    '{*}'::text[]
);

