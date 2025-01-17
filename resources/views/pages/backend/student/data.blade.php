<html>
<div class="table-responsive">
    <table id="example1" class="table table-bordered table-striped dataTable dtr-inline" aria-describedby="example1_info">
        <thead>
            <tr>
                <th class="sorting sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                    aria-label="Rendering engine: activate to sort column descending" aria-sort="ascending"
                    style="">
                    ID</th>
                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                    aria-label="Browser: activate to sort column ascending">Họ tên
                </th>
                <th style="width: 10%" class="sorting" tabindex="0" aria-controls="example1" rowspan="1"
                    colspan="1" aria-label="Browser: activate to sort column ascending">Hình ảnh</th>


                <th style="width: 15%" class="sorting" tabindex="0" aria-controls="example1" rowspan="1"
                    colspan="1" aria-label="Platform(s): activate to sort column ascending" style="">Email
                </th>
                


                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
                    aria-label="CSS grade: activate to sort column ascending" style="">Hành động</th>
            </tr>
        </thead>
        <tbody>
            <div>

                @foreach ($students as $student)
                    <tr class=''>

                        <td class="sorting_1 dtr-control" tabindex="0" style="">
                            <span class="badge badge-success">

                                {{ $student->id }}
                            </span>
                        </td>
                        <td class="">{{ $student->name }}</td>
                        <td class="">
                            <img style="width: 100%" src="{{ asset('storage/' . $student->image_path) }}"
                                alt="">
                        </td>


                       


                        <td>{{ $student->email }}</td>

                       

                        <td>

                            <a style="margin: 0 4px"
                                href='{{ route('admin.student.profile', ['student' => $student]) }}'>
                                <span style="border-radius: 2px" title="Link" type='button'
                                    class="btn btn-flat btn-sm btn-info">
                                    <i class="fas fa-external-link-alt    "></i>
                                </span>
                            </a>

                            <a style="margin: 0 4px" href='{{ route('admin.student.edit', ['student' => $student]) }}'>
                                <span style="border-radius: 2px" title="Edit" type='button'
                                    class="btn btn-flat btn-sm btn-primary">
                                    <i class="fas fa-edit    "></i>
                                </span>
                            </a>


                            <a style="margin: 0 4px; border-radius: 4px"
                                href='{{ route('admin.student.delete', ['student' => $student]) }}'>
                                <span style="border-radius: 2px" title="Delete" type='button'
                                    onclick="return confirmDelete() " class="btn btn-flat btn-sm btn-danger">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </span></a>
                            </a>


                        </td>



                    </tr>
                @endforeach
            </div>

        </tbody>

    </table>

    <div class="container">
        <div class="row">

            <div class="col-sm-12 col-md-5">
                <div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Hiển thị
                    {{ $students->firstItem() }} - {{ $students->lastItem() }} / {{ $students->total() }} người dùng.
                </div>
            </div>
            {!! $students->links() !!}
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
