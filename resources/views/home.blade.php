@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-10 my-3 mx-2">
                <div>
                    <canvas id="myChart" width="400" height="200"></canvas>
                </div>

            </div>
            <small class="mx-3 text-center"><i>Biểu đồ Thống kê Tổng Tiền Thanh Toán Theo Từng Tháng</i> </small>
        </div>
    </div>
@endsection

<!-- Thêm Chart.js từ CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        fetch('/thong-ke')
            .then(response => response.json())
            .then(data => {
                const allMonths = [
                    'Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6',
                    'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'
                ];
                const thisYearData = data.filter(entry => entry.year === new Date().getFullYear());
                const amounts = allMonths.map((month, index) => getMonthAmount(index + 1, thisYearData) || 0);

                function getMonthAmount(month, data) {
                    const monthData = data.find(entry => entry.month === month);
                    return monthData ? monthData.total_amount : null;
                }

                const ctx = document.getElementById('myChart').getContext('2d');
                const myChart = new Chart(ctx, {
                    type: 'bar',  // bar//
                    data: {
                        labels: allMonths,
                        datasets: [{
                            label: 'Doanh thu theo tháng',
                            data: amounts,
                            backgroundColor: 'rgb(203,250,237)',
                            fill: true, // Thêm dòng này nếu sử dụng line chart
                            borderColor: 'rgb(47,164,136)',
                            borderWidth: 0.5
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            })
            .catch(error => {
                console.error('Error fetching data:', error);
            });
    });
</script>

