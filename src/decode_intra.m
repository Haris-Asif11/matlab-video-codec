function decode_intra(coded_file, decoded_yuv_file)
load(coded_file)
runlevel_representation = decode_signal_from_huffman_bitstream(coded_file, huffman_table);
zigzag_scanned = blockbased_decoding_from_runlevel_representation(runlevel_representation, transform_blocksize);
input_levels = blockbased_decoding_from_zigzag_scanned(zigzag_scanned, transform_blocksize, width, height);
quantisation_matrix = get_quantisation_matrix(qp, transform_blocksize);
zigzag_scanned = blockbased_dequantizer_from_levels(input_levels, quantisation_matrix);
itransformed_image= blockbased_idct_on_image(zigzag_scanned);
retval = yuv_write_one_frame("momin.yuv", 1,itransformed_image);
