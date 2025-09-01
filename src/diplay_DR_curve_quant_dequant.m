function display_DR_curve_quant_dequant(input_image)
rate = [];
psnr = [];
normalised_image = im2double(input_image);
for N = 1:8
    rate = [rate, N];
    quantizer_stepsize = 2/2^N;
    quant_image = simple_quantizer(normalised_image, quantizer_stepsize);
    dequant_image = simple_dequantizer(quant_image, quantizer_stepsize);
    psnr = [psnr psnr_of_frame(normalised_image, dequant_image)];

    subplot(2,2,[1,2])
    plot(rate, psnr);
    xlabel('Rate (Bits per Pixel)');
    ylabel('PSNR (dB)');
    xlim([1 8])
    ylim([0 60])

    subplot(2,2,3)
    imshow(input_image)
    title('Original Image')

    subplot(2,2,4)
    imshow(dequant_image)
    title('Decompressed Image')
    pause(2)
end
end