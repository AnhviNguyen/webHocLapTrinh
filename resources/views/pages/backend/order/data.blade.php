<html>
    <div class="table-responsive">
        <table id="example1" class="table table-bordered table-striped dataTable dtr-inline" aria-describedby="example1_info">
            <thead>
                <tr>
    
                    <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                        aria-label="Rendering engine: activate to sort column descending" aria-sort="ascending"
                        style="">
                        ID</th>
                    <th style="width: 20%" class="sorting" tabindex="0" aria-controls="example1" rowspan="1"
                        colspan="1" aria-label="Browser: activate to sort column ascending">Học viên</th>
                    <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                        aria-label="Platform(s): activate to sort column ascending" style="">Tổng tiền</th>
                   
                    <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                        aria-label="Platform(s): activate to sort column ascending" style="">Date</th>
                    <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                        aria-label="Platform(s): activate to sort column ascending" style="">Status</th>
                    <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                        aria-label="CSS grade: activate to sort column ascending" style="">Hành động</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($orders as $order)
                    <tr class=''>
                        <td class="sorting_1 dtr-control" tabindex="0" style="">
                            <span class="badge badge-success">
                                {{ $order->id }}
                            </span>
                        </td>
                        <td style="">
                            <a href="">
                                <p>{{ $order->student->name }}</p>
                            </a>
                        </td>
                        <td> <a href="">
                                <p>{{ $order->total }}</p>
                            </a>
                        </td>
                       
                        <td>
                            {{ $order->created_at }}
                        </td>
                        <td>
    
                            @if ($order->status == 1)
                                <span class="badge badge-success">
                                    ACTIVE
                                </span>
                            @else
                                <span class="badge badge-danger">
                                    INACTIVE
                                </span>
                            @endif
                        </td>
                        <td style="width: 15%">
    
                            <a style="margin: 0 4px" href='{{ route('admin.order.detail', ['order' => $order]) }}'>
                                <span style="border-radius: 2px" title="Link" type='button'
                                    class="btn btn-flat btn-sm btn-info">
                                    <i class="fas fa-external-link-alt    "></i>
                                </span>
                            </a>
    
                            <a style="margin: 0 4px; border-radius: 4px"
                                href='{{ route('admin.order.delete', ['order' => $order]) }}'>
                                <span style="border-radius: 2px" title="Delete" type='button'
                                    onclick="return confirmDelete() " class="btn btn-flat btn-sm btn-danger">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </span></a>
                            </a>
    
                        </td>
                        <td>
                            @if ($order->status == '0')
                                <a style="margin: 0 4px; border-radius: 4px"
                                    href='{{ route('admin.order.confirm', ['order' => $order]) }}'>
                                    <span style="border-radius: 2px" title="Duyệt" type='button'
                                        class="btn btn-flat btn-warning">
                                        <i class="fa fa-check" aria-hidden="true"></i>
                                    </span></a>
                                </a>
                            @endif
                        </td>
    
                    </tr>
                @endforeach
    
            </tbody>
    
        </table>
        <div class="container">
            <div class="row">
    
                <div class="col-sm-12 col-md-5">
                    <div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Hiển thị
                        {{ $orders->firstItem() }} - {{ $orders->lastItem() }} / {{ $orders->total() }} đơn hàng.
                    </div>
                </div>
                {!! $orders->links() !!}
            </div>
        </div>
    </div>
</html>


<script>
    function confirmDelete() {

        var result = confirm("Bạn có chắc chắn muốn xóa không?");
        return result;
    }

    function confirmRestore() {

        var result = confirm("Bạn có chắc chắn muốn khôi phục không?");
        return result;
    }
</script>
