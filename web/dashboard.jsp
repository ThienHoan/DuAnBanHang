
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard - Công Ty Gia Truyền Hồng Đức</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
                margin-bottom: 20px;
            }
            .card-title {
                font-weight: bold;
                text-align: center;
                margin-top: 10px;
            }
            .user-info {
                text-align: right;
                margin-bottom: 20px;
            }
            .nav-tabs .nav-link {
                cursor: pointer;
            }
            .podium-wrapper {
                display: flex;
                justify-content: center;
                align-items: flex-end;
                margin: 40px 0;
                gap: 10px;
            }

            .podium-item {
                display: flex;
                flex-direction: column;
                align-items: center;
                transition: all 0.3s ease;
            }

            .podium-item:hover {
                transform: translateY(-10px);
            }

            .podium-block {
                width: 200px;
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 15px;
                border-radius: 8px 8px 0 0;
                color: white;
            }

            .first-place {
                height: 200px;
                background: linear-gradient(45deg, #FFD700, #FFA500);
                order: 2;
            }

            .second-place {
                height: 150px;
                background: linear-gradient(45deg, #C0C0C0, #E8E8E8);
                order: 1;
            }

            .third-place {
                height: 100px;
                background: linear-gradient(45deg, #CD7F32, #B87333);
                order: 3;
            }

            .podium-rank {
                font-size: 2em;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .podium-name {
                font-size: 1.2em;
                text-align: center;
                margin-bottom: 5px;
                word-wrap: break-word;
            }

            .podium-sales {
                font-size: 0.9em;
            }

            .podium-revenue {
                font-size: 1.1em;
                font-weight: bold;
            }

            .other-rankings {
                margin-top: 30px;
            }

            .crown-icon {
                font-size: 2em;
                margin-bottom: 10px;
                color: #FFD700;
            }

            .table > tbody > tr > td {
                vertical-align: middle;
            }

            .badge {
                font-size: 0.9rem;
                padding: 0.5em 1em;
            }

            .rank-cell {
                text-align: center;
            }

            @media (max-width: 768px) {
                .podium-block {
                    width: 150px;
                }
                .podium-name {
                    font-size: 1em;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <a href="home" class="btn btn-primary">
                    <i class="material-icons">&#xe88a;</i> Trang chủ
                </a>
                <div class="user-info">
                    <div>Người dùng: ${sessionScope.account.userName != null ? sessionScope.account.userName : "null" }</div>
                    <div>Thời gian: <%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) %></div>
                </div>
            </div>

            <h2 class="text-center mb-4">📊 Thống kê doanh thu</h2>

            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="month-tab" data-bs-toggle="tab" data-bs-target="#month" type="button" role="tab">
                        Doanh thu theo tháng
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="year-tab" data-bs-toggle="tab" data-bs-target="#year" type="button" role="tab">
                        Doanh thu theo năm
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="products-tab" data-bs-toggle="tab" data-bs-target="#products" type="button" role="tab">
                        Top sản phẩm bán chạy
                    </button>
                </li>
            </ul>

            <div class="tab-content mt-3" id="myTabContent">
                <div class="tab-pane fade show active" id="month" role="tabpanel">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">📅 Doanh thu theo tháng</h5>
                            <div id="revenueByMonthChart"></div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="year" role="tabpanel">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">📆 Doanh thu theo năm</h5>
                            <div id="revenueByYearChart"></div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="products" role="tabpanel">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">🏆 Top sản phẩm bán chạy</h5>
                            <div class="podium-wrapper">
                                <!-- Podium sẽ được thêm vào đây bằng JavaScript -->
                            </div>
                            <div class="other-rankings">
                                <table class="table table-striped">
                                    <thead class="table-dark">
                                        <tr>
                                            <th class="text-center" style="width: 80px;">Rank</th>
                                            <th>Tên sản phẩm</th>
                                            <th class="text-center">Số lượng bán</th>
                                            <th class="text-end">Doanh thu</th>
                                        </tr>
                                    </thead>
                                    <tbody id="topSellingProductsBody"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
    // Lấy dữ liệu từ server
    var revenueByMonth = <%= request.getAttribute("revenueByMonth") != null ? request.getAttribute("revenueByMonth") : "{}" %>;
    var revenueByYear = <%= request.getAttribute("revenueByYear") != null ? request.getAttribute("revenueByYear") : "{}" %>;
    var topSellingProducts = <%= request.getAttribute("topSellingProducts") != null ? request.getAttribute("topSellingProducts") : "[]" %>;

    // Hàm định dạng tiền tệ
    function formatCurrency(amount) {
        try {
            return new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND',
                maximumFractionDigits: 0
            }).format(amount);
        } catch (error) {
            console.error('Error formatting currency:', error);
            return '0 ₫';
        }
    }

    // Hàm tạo badge xếp hạng
    function createRankBadge(rank) {
        let badgeClass = 'bg-secondary';
        if (rank === 1) {
            badgeClass = 'bg-warning text-dark';
        } else if (rank === 2) {
            badgeClass = 'bg-light text-dark';
        } else if (rank === 3) {
            badgeClass = 'bg-bronze text-white';
        }
        return `<span class="badge ${badgeClass} rounded-pill">#${rank}</span>`;
    }

    // Hàm tạo podium
    function createPodium(products) {
        const podiumWrapper = document.querySelector('.podium-wrapper');
        podiumWrapper.innerHTML = ''; // Clear existing content
        const top3Products = products.slice(0, 3);
        const podiumOrder = [1, 0, 2]; // Thứ tự hiển thị: 2nd, 1st, 3rd

        podiumOrder.forEach(index => {
            if (top3Products[index]) {
                const product = top3Products[index];
                const place = index + 1;
                const placeClass = ['first-place', 'second-place', 'third-place'][index];
                const crown = place === 1 ? '👑' : '';
                const formattedRevenue = formatCurrency(product.revenue);

                const podiumItem = document.createElement('div');
                podiumItem.className = 'podium-item';
                podiumItem.innerHTML = `
                    <div class="podium-block ${placeClass}">
                        ${crown}
                        <div class="podium-rank">#${place}</div>
                        <div class="podium-name">${product.name}</div>
                        <div class="podium-sales">${product.sold} đã bán</div>
                        <div class="podium-revenue">${formattedRevenue}</div>
                    </div>
                `;
                podiumWrapper.appendChild(podiumItem);
            }
        });
    }

    // Hàm hiển thị sản phẩm
    function displayProducts(products) {
        // Hiển thị podium cho top 3
        createPodium(products);

        // Hiển thị bảng cho các sản phẩm còn lại (từ thứ 4 trở đi)
        const topSellingProductsBody = document.getElementById('topSellingProductsBody');
        topSellingProductsBody.innerHTML = ''; // Clear existing content

        products.slice(3).forEach((product, index) => {
            const rank = index + 4;
            const formattedRevenue = formatCurrency(product.revenue);
            const row = document.createElement('tr');
            row.innerHTML = `
                <td class="text-center">
                    <span class="badge bg-secondary rounded-pill">#${rank}</span>
                </td>
                <td>${product.name}</td>
                <td class="text-center">${product.sold}</td>
                <td class="text-end">${formattedRevenue}</td>
            `;
            topSellingProductsBody.appendChild(row);
        });
    }

    // Cấu hình biểu đồ tháng
    var monthChartOptions = {
        chart: {
            type: 'bar',
            height: 350
        },
        series: [{
            name: 'Doanh thu',
            data: Object.values(revenueByMonth)
        }],
        xaxis: {
            categories: Object.keys(revenueByMonth)
        },
        yaxis: {
            labels: {
                formatter: function (val) {
                    return formatCurrency(val);
                }
            }
        },
        tooltip: {
            y: {
                formatter: function (val) {
                    return formatCurrency(val);
                }
            }
        }
    };

    // Cấu hình biểu đồ năm
    var yearChartOptions = {
        chart: {
            type: 'line',
            height: 350
        },
        series: [{
            name: 'Doanh thu',
            data: Object.values(revenueByYear)
        }],
        xaxis: {
            categories: Object.keys(revenueByYear)
        },
        yaxis: {
            labels: {
                formatter: function (val) {
                    return formatCurrency(val);
                }
            }
        },
        tooltip: {
            y: {
                formatter: function (val) {
                    return formatCurrency(val);
                }
            }
        }
    };

    // Khởi tạo và render biểu đồ
    var monthChart = new ApexCharts(document.querySelector("#revenueByMonthChart"), monthChartOptions);
    var yearChart = new ApexCharts(document.querySelector("#revenueByYearChart"), yearChartOptions);
    monthChart.render();
    yearChart.render();

    // Hiển thị sản phẩm bán chạy
    displayProducts(topSellingProducts);

    // Xử lý sự kiện chuyển tab
    var tabElements = document.querySelectorAll('button[data-bs-toggle="tab"]');
    tabElements.forEach(function (tab) {
        tab.addEventListener('shown.bs.tab', function (event) {
            if (event.target.id === 'year-tab') {
                yearChart.render();
            } else if (event.target.id === 'month-tab') {
                monthChart.render();
            }
        });
    });
});
    </script>
</body>
</html>