<%-- 
    Document   : dashboard
    Created on : Mar 22, 2025, 5:34:37 PM
    Author     : hoan6
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Sales Data</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .container {
            margin-top: 30px;
        }
        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-title {
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }
        #chart {
            padding: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center mb-4">📊 Product Sales Dashboard</h2>

    <div class="row">
        <!-- Biểu đồ cột - Doanh thu theo tháng -->
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">📅 Doanh thu theo tháng</h5>
                    <div id="revenueByMonthChart"></div>
                </div>
            </div>
        </div>

        <!-- Biểu đồ đường - Doanh thu theo năm -->
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">📆 Doanh thu theo năm</h5>
                    <div id="revenueByYearChart"></div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bảng sản phẩm bán chạy nhất -->
    <div class="row mt-4">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">🔥 Sản phẩm bán chạy nhất</h5>
                    <table class="table table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>Tên sản phẩm</th>
                                <th>Số lượng bán</th>
                                <th>Doanh thu</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                List<Map<String, Object>> topSellingProducts = (List<Map<String, Object>>) request.getAttribute("topSellingProducts");
                                if (topSellingProducts != null && !topSellingProducts.isEmpty()) {
                                    for (Map<String, Object> product : topSellingProducts) {
                            %>
                            <tr>
                                <td><%= product.get("name") %></td>
                                <td><%= product.get("sold") %></td>
                                <td>$<%= product.get("revenue") %></td>
                            </tr>
                            <% 
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="3" class="text-center text-muted">Không có dữ liệu</td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Lấy dữ liệu từ server, bọc JSON trong dấu nháy đơn tránh lỗi JS
    var revenueByMonth = JSON.parse('<%= request.getAttribute("revenueByMonth") %>');
    var revenueByYear = JSON.parse('<%= request.getAttribute("revenueByYear") %>');

    // Biểu đồ cột - Doanh thu theo tháng
    var optionsMonth = {
        chart: { type: 'bar', height: 350 },
        colors: ['#1E88E5'],
        title: { text: 'Doanh thu theo tháng', align: 'center' },
        xaxis: { categories: Object.keys(revenueByMonth) },
        series: [{ name: 'Doanh thu (USD)', data: Object.values(revenueByMonth) }]
    };
    new ApexCharts(document.querySelector("#revenueByMonthChart"), optionsMonth).render();

    // Biểu đồ đường - Doanh thu theo năm
    var optionsYear = {
        chart: { type: 'line', height: 350 },
        colors: ['#F4511E'],
        title: { text: 'Doanh thu theo năm', align: 'center' },
        xaxis: { categories: Object.keys(revenueByYear) },
        series: [{ name: 'Doanh thu (USD)', data: Object.values(revenueByYear) }]
    };
    new ApexCharts(document.querySelector("#revenueByYearChart"), optionsYear).render();
</script>

</body>
</html>




